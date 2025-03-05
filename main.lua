-- ตั้งค่าธีมสี
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FishingUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(0.4, 0, 0.2, 0)
frame.Position = UDim2.new(0.3, 0, 0.4, 0)  -- อยู่กลางจอ
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- สีดำ
frame.Active = true  -- ให้สามารถลากได้

-- เพิ่มการลาก UI
frame.Draggable = true
frame.Selectable = true

-- ตั้งค่าฟอนต์เป็น NotoSans
local title = Instance.new("TextLabel")
title.Parent = frame
title.Text = "ตกปลาหลอดเต็ม"
title.Size = UDim2.new(1, 0, 0.2, 0)
title.TextColor3 = Color3.fromRGB(0, 255, 0)  -- สีเขียว
title.TextSize = 24
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSans -- ปรับเป็นฟอนต์ที่ใกล้เคียง NotoSans เนื่องจาก Roblox ไม่รองรับฟอนต์นี้

-- ทำหลอดสำหรับการตกปลา
local progressBarBackground = Instance.new("Frame")
progressBarBackground.Parent = frame
progressBarBackground.Size = UDim2.new(0.8, 0, 0.1, 0)
progressBarBackground.Position = UDim2.new(0.1, 0, 0.4, 0)
progressBarBackground.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- สีดำ

local progressBar = Instance.new("Frame")
progressBar.Parent = progressBarBackground
progressBar.Size = UDim2.new(0, 0, 1, 0)  -- เริ่มต้นที่ขนาด 0
progressBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  -- สีขาว

-- เพิ่มปุ่มเปิด-ปิด UI
local toggleButton = Instance.new("TextButton")
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0.1, 0, 0.1, 0)
toggleButton.Position = UDim2.new(0.45, 0, 0.85, 0)
toggleButton.Text = "เปิด/ปิด"
toggleButton.TextColor3 = Color3.fromRGB(0, 255, 0)  -- สีเขียว
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- สีดำ
toggleButton.Font = Enum.Font.SourceSans  -- ปรับเป็นฟอนต์ที่ใกล้เคียง NotoSans

-- ฟังก์ชันสำหรับการควบคุมการแสดงผลของ UI
local isUIVisible = true

toggleButton.MouseButton1Click:Connect(function()
    isUIVisible = not isUIVisible
    screenGui.Enabled = isUIVisible
end)

-- ฟังก์ชันสำหรับการทำให้หลอดเต็ม
local function fillProgressBar()
    for i = 0, 100, 1 do
        wait(0.05)  -- ช้าลงตามความต้องการ
        progressBar.Size = UDim2.new(i / 100, 0, 1, 0)
    end
end

-- เรียกใช้ฟังก์ชัน fillProgressBar เมื่อ UI เปิดขึ้น
fillProgressBar()