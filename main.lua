local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/zynex-lab/Zynex/refs/heads/main/main.lua"))()

local Window = redzlib:MakeWindow({
  Title = "Fisch Fishing",
  SubTitle = "ตกปลาหลอดเต็ม",
  SaveFolder = "Redz Config",
  Theme = {
    BackgroundColor = Color3.fromRGB(0, 0, 0), -- สีพื้นหลังดำ
    TextColor = Color3.fromRGB(0, 255, 0), -- ข้อความสีเขียว
    ButtonColor = Color3.fromRGB(0, 128, 0), -- ปุ่มสีเขียวเข้ม
    ToggleColor = Color3.fromRGB(0, 128, 0), -- Toggle สีเขียวเข้ม
    SliderColor = Color3.fromRGB(0, 128, 0), -- สไลเดอร์สีเขียวเข้ม
  },
  Font = Enum.Font.SourceSans -- เปลี่ยนเป็นฟอนต์ Anuphan หากรองรับ
})

-- Tabs
local Tab1 = Window:MakeTab({"ตกปลา", "Fishing"})

-- Buttons
Tab1:AddButton({
  Name = "Print",
  Description = "ทดสอบ",
  Callback = function()
    print("Hello World!")
  end,
  ButtonColor = Color3.fromRGB(0, 128, 0), -- สีปุ่มเขียวเข้ม
})

-- Toggle
local Toggle1 = Tab1:AddToggle({
  Name = "Speed",
  Description = "ปรับความเร็ว",
  Default = false,
  ToggleColor = Color3.fromRGB(0, 128, 0), -- สี Toggle เขียวเข้ม
})

-- Slider
Tab1:AddSlider({
  Name = "Speed",
  Min = 1,
  Max = 100,
  Increase = 1,
  Default = 16,
  Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
  end,
  SliderColor = Color3.fromRGB(0, 128, 0), -- สีสไลเดอร์เขียวเข้ม
})