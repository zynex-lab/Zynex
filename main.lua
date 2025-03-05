local Player = game:GetService("Players")
local LocalPlayer = Player.LocalPlayer
local Char = LocalPlayer.Character
local Humanoid = Char.Humanoid
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GuiService = game:GetService("GuiService")

equipitem = function(v)
    if LocalPlayer.Backpack:FindFirstChild(v) then
        local a = LocalPlayer.Backpack:FindFirstChild(v)
        Humanoid:EquipTool(a)
    end
end

-- โหลด UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zynex-lab/Zynex/refs/heads/main/main.lua"))()
local Window = Library.CreateLib("Fisch", "DarkTheme")
local Tab = Window:NewTab("หลัก")
local Section = Tab:NewSection("ฟังก์ชันหลัก")

-- ตั้งค่าฟอนต์
Window.Main.TextLabel.Font = Enum.Font.SourceSans
Window.Main.TextLabel.Text = "GPT Fisch" -- ชื่อ UI
Window.Main.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

-- ปรับขนาด UI
local isUIVisible = true

-- สร้างปุ่มเปิด/ปิด UI
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = game.Players.LocalPlayer.PlayerGui:WaitForChild("ScreenGui")
ToggleButton.Size = UDim2.new(0, 100, 0, 40)
ToggleButton.Position = UDim2.new(0.5, -50, 0.9, 0)  -- ปุ่มที่มุมล่าง
ToggleButton.Text = "เปิด/ปิด UI"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.TextSize = 20

ToggleButton.MouseButton1Click:Connect(function()
    isUIVisible = not isUIVisible
    Window.Enabled = isUIVisible
end)

-- การย่อ UI
local function resizeUI()
    -- สร้างปุ่มย่อ/ขยาย
    local ResizeButton = Instance.new("TextButton")
    ResizeButton.Parent = Window.Main
    ResizeButton.Size = UDim2.new(0, 20, 0, 20)
    ResizeButton.Position = UDim2.new(1, -20, 0, 0)
    ResizeButton.Text = "+"
    ResizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ResizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ResizeButton.Font = Enum.Font.SourceSans
    ResizeButton.TextSize = 20

    ResizeButton.MouseButton1Click:Connect(function()
        if Window.Size == UDim2.new(0.3, 0, 0.4, 0) then
            Window.Size = UDim2.new(0.3, 0, 0.1, 0)  -- ขนาดย่อ
            ResizeButton.Text = "+"
        else
            Window.Size = UDim2.new(0.3, 0, 0.4, 0)  -- ขนาดเต็ม
            ResizeButton.Text = "-"
        end
    end)
end

resizeUI()

-- AutoCast
Section:NewToggle("เปิดการตกปลาอัตโนมัติ", "เปิด/ปิด การตกปลาอัตโนมัติ", function(v)
    _G.AutoCast = v
    pcall(function()
        while _G.AutoCast do
            wait()
            local Rod = Char:FindFirstChildOfClass("Tool")
            task.wait(0.1)
            Rod.events.cast:FireServer(100, 1)
        end
    end)
end)

-- AutoShake
Section:NewToggle("เปิดการเขย่าอัตโนมัติ", "เปิด/ปิด การเขย่าอัตโนมัติ", function(v)
    _G.AutoShake = v
    pcall(function()
        while _G.AutoShake do
            wait()
            task.wait(0.01)
            local PlayerGUI = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
            local shakeUI = PlayerGUI:FindFirstChild("shakeui")
            if shakeUI and shakeUI.Enabled then
                local safezone = shakeUI:FindFirstChild("safezone")
                if safezone then
                    local button = safezone:FindFirstChild("button")
                    if button and button:IsA("ImageButton") and button.Visible then
                        GuiService.SelectedObject = button
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end
                end
            end
        end
    end)
end)

-- AutoReel
Section:NewToggle("เปิดการดึงสายอัตโนมัติ", "เปิด/ปิด การดึงสายอัตโนมัติ", function(v)
    _G.AutoReel = v
    pcall(function()
        while _G.AutoReel do
            wait()
            for i, v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
                if v:IsA("ScreenGui") and v.Name == "reel" then
                    if v:FindFirstChild("bar") then
                        wait(0.15)
                        ReplicatedStorage.events.reelfinished:FireServer(100, true)
                    end
                end
            end
        end
    end)
end)

-- Freeze Character
Section:NewToggle("หยุดการเคลื่อนไหวตัวละคร", "เปิด/ปิด การหยุดการเคลื่อนไหวตัวละคร", function(v)
    Char.HumanoidRootPart.Anchored = v
end)

-- equipitem
spawn(function()
    while wait() do
        if _G.AutoCast then
            pcall(function()
                for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name:lower():find("rod") then
                        equipitem(v.Name)
                    end
                end
            end)
        end
    end
end)