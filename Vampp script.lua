--==================================================
--  MUSCLE LEGENDS OP SCRIPT
--  Made by: Right Vampp Official
--==================================================

-- Services
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local Player = Players.LocalPlayer

-- Anti AFK
Player.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

-- UI
local Gui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", Gui)
Frame.Size = UDim2.new(0,340,0,350)
Frame.Position = UDim2.new(0.3,0,0.2,0)
Frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1,0,0,50)
Title.BackgroundTransparency = 1
Title.Text = "MUSCLE LEGENDS"
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(255,0,0)

local Credit = Instance.new("TextLabel", Frame)
Credit.Position = UDim2.new(0,0,0.15,0)
Credit.Size = UDim2.new(1,0,0,30)
Credit.BackgroundTransparency = 1
Credit.Text = "Right Vampp Official"
Credit.Font = Enum.Font.Gotham
Credit.TextScaled = true
Credit.TextColor3 = Color3.fromRGB(255,255,255)

-- Button maker
local function Button(txt, y)
    local b = Instance.new("TextButton", Frame)
    b.Size = UDim2.new(0.8,0,0,40)
    b.Position = UDim2.new(0.1,0,y,0)
    b.BackgroundColor3 = Color3.fromRGB(170,0,0)
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextScaled = true
    b.Text = txt
    return b
end

local StrengthBtn = Button("Auto Strength : OFF", 0.28)
local AgilityBtn  = Button("Auto Agility : OFF", 0.40)
local RebirthBtn  = Button("Auto Rebirth : OFF", 0.52)
local BossBtn     = Button("Auto Boss Farm : OFF", 0.64)

-- Toggles
local strength, agility, rebirth, boss = false, false, false, false

-- Auto Strength
StrengthBtn.MouseButton1Click:Connect(function()
    strength = not strength
    StrengthBtn.Text = strength and "Auto Strength : ON" or "Auto Strength : OFF"
    task.spawn(function()
        while strength do
            task.wait(0.15)
            pcall(function()
                RS.Remotes.Punch:FireServer()
            end)
        end
    end)
end)

-- Auto Agility
AgilityBtn.MouseButton1Click:Connect(function()
    agility = not agility
    AgilityBtn.Text = agility and "Auto Agility : ON" or "Auto Agility : OFF"
    task.spawn(function()
        while agility do
            task.wait(0.2)
            pcall(function()
                Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end)
        end
    end)
end)

-- Auto Rebirth
RebirthBtn.MouseButton1Click:Connect(function()
    rebirth = not rebirth
    RebirthBtn.Text = rebirth and "Auto Rebirth : ON" or "Auto Rebirth : OFF"
    task.spawn(function()
        while rebirth do
            task.wait(1)
            pcall(function()
                RS.Remotes.Rebirth:FireServer()
            end)
        end
    end)
end)

-- Auto Boss Farm
BossBtn.MouseButton1Click:Connect(function()
    boss = not boss
    BossBtn.Text = boss and "Auto Boss Farm : ON" or "Auto Boss Farm : OFF"

    task.spawn(function()
        while boss do
            task.wait(0.3)
            pcall(function()
                for _,v in pairs(workspace:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v.Name ~= Player.Name then
                        Player.Character.HumanoidRootPart.CFrame =
                            v.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                        RS.Remotes.Punch:FireServer()
                    end
                end
            end)
        end
    end)
end)
