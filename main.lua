-- สร้าง UI ใน Roblox
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 400, 0, 100)
Frame.Position = UDim2.new(0.5, -200, 0.5, -50)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.AnchorPoint = Vector2.new(0.5, 0.5)

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0.2, 0)
Title.Text = "ตกปลาหลอดเต็ม"
Title.TextColor3 = Color3.fromRGB(0, 255, 0) -- เขียว
Title.TextSize = 24
Title.TextAlign = Enum.TextXAlignment.Center
Title.BackgroundTransparency = 1

local ProgressBar = Instance.new("Frame")
ProgressBar.Parent = Frame
ProgressBar.Size = UDim2.new(0.8, 0, 0.2, 0)
ProgressBar.Position = UDim2.new(0.1, 0, 0.5, -10)
ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- เขียว
ProgressBar.BorderSizePixel = 0

local ProgressBarFill = Instance.new("Frame")
ProgressBarFill.Parent = ProgressBar
ProgressBarFill.Size = UDim2.new(0, 0, 1, 0) -- เริ่มต้นความยาวเป็น 0
ProgressBarFill.BackgroundColor3 = Color3.fromRGB(0, 128, 0) -- สีเขียวเข้ม
ProgressBarFill.BorderSizePixel = 0

-- ฟังก์ชันในการเติมหลอด
local function fillProgressBar()
    for i = 0, 100, 1 do
        wait(0.05) -- ตั้งเวลาให้หลอดเต็มช้าๆ
        ProgressBarFill.Size = UDim2.new(i / 100, 0, 1, 0)
    end
end

-- ปุ่มเริ่มตกปลา
local StartButton = Instance.new("TextButton")
StartButton.Parent = Frame
StartButton.Size = UDim2.new(0.4, 0, 0.3, 0)
StartButton.Position = UDim2.new(0.3, 0, 0.8, -15)
StartButton.Text = "เริ่มตกปลา"
StartButton.TextColor3 = Color3.fromRGB(0, 255, 0)
StartButton.TextSize = 20
StartButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
StartButton.BorderSizePixel = 0

StartButton.MouseButton1Click:Connect(function()
    fillProgressBar() -- เริ่มเติมหลอดเมื่อคลิก
end)