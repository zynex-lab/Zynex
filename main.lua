local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- สร้าง GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "FischUI"

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 250, 0, 150)
MainFrame.Position = UDim2.new(0, 50, 0, 50)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "Fisch Hub"
Title.TextColor3 = Color3.fromRGB(0, 255, 100)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22

local function createButton(text, posY)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 200, 0, 40)
    Button.Position = UDim2.new(0, 25, 0, posY)
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Button.TextColor3 = Color3.fromRGB(0, 255, 100)
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 20
    Button.Text = text
    Button.Parent = MainFrame
    return Button
end

local AutoFarmButton = createButton("Auto Farm", 40)
local TPButton = createButton("Teleport", 90)

-- ระบบลากหน้าต่าง
local dragging, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- ระบบ Auto Farm จริง ๆ
local farming = false
AutoFarmButton.MouseButton1Click:Connect(function()
    farming = not farming
    AutoFarmButton.Text = farming and "Stop Farm" or "Auto Farm"
    while farming do
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") and v.Parent:IsA("Part") then
                fireproximityprompt(v)
                task.wait(0.1)
            end
        end
        task.wait(1)
    end
end)

-- ระบบ Teleport ไปจุด (ใส่พิกัดเองได้)
TPButton.MouseButton1Click:Connect(function()
    local targetPos = Vector3.new(100, 50, 100) -- ตำแหน่ง Teleport
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPos)
    end
end)