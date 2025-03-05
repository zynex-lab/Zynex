local ScreenGui = Instance.new("ScreenGui")
local AutoFarmButton = Instance.new("TextButton")
local TPButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

AutoFarmButton.Parent = ScreenGui
AutoFarmButton.Position = UDim2.new(0, 20, 0, 100)
AutoFarmButton.Size = UDim2.new(0, 150, 0, 50)
AutoFarmButton.Text = "Auto Farm"
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
AutoFarmButton.TextColor3 = Color3.new(1, 1, 1)

TPButton.Parent = ScreenGui
TPButton.Position = UDim2.new(0, 20, 0, 160)
TPButton.Size = UDim2.new(0, 150, 0, 50)
TPButton.Text = "Teleport"
TPButton.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
TPButton.TextColor3 = Color3.new(1, 1, 1)

local farming = false
AutoFarmButton.MouseButton1Click:Connect(function()
    farming = not farming
    AutoFarmButton.Text = farming and "Stop Farm" or "Auto Farm"
    while farming do
        for _, v in pairs(workspace.Resources:GetChildren()) do
            if v:IsA("Part") and v:FindFirstChild("ProximityPrompt") then
                fireproximityprompt(v.ProximityPrompt)
                wait(0.2)
            end
        end
        wait(1)
    end
end)

TPButton.MouseButton1Click:Connect(function()
    local targetPos = Vector3.new(100, 50, 100)
    game.Players.LocalPlayer.Character:MoveTo(targetPos)
end)
