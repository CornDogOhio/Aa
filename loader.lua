wait("0.2")
--[[
â–ˆâ–€â–ˆâ€ƒâ–ˆâ–‘â–‘â€ƒâ–ˆâ–‘â–ˆâ€ƒâ–ˆâ–‘â–ˆ
â–ˆâ–€â–€â€ƒâ–ˆâ–„â–„â€ƒâ–ˆâ–„â–ˆâ€ƒâ–ˆâ–€â–ˆ

ong, ts "8$ paid" script is skidded from bladlock and fearlas. Nigga putted an table

getgenv().lol = {
        Prediction = 0.09,
        Smoothness= 0.0421,
        Button = true,
        AimPart = "UpperTorso",
    }

that doesn't even work ðŸ˜­ðŸ™
enjoy the horrid source.

â–ˆâ–€â–ˆâ€ƒâ–ˆâ–‘â–‘â€ƒâ–ˆâ–‘â–ˆâ€ƒâ–ˆâ–‘â–ˆ
â–ˆâ–€â–€â€ƒâ–ˆâ–„â–„â€ƒâ–ˆâ–„â–ˆâ€ƒâ–ˆâ–€â–ˆ
]]--
loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Adonis-Anticheat-Bypass-11111"))()
----------------------------------------------------------------------------------------------------------------------------------------------
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.new(1, 1, 1)
frame.Parent = screenGui
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0, -20)
title.Text = "Lol.xd CamLock Script"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.new(0, 0, 0)
title.Parent = frame
----------------------------------------------------------------------------------------------------------------------------------------------
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        dragInput = nil
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
----------------------------------------------------------------------------------------------------------------------------------------------
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -20, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton.Parent = frame

CloseButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
----------------------------------------------------------------------------------------------------------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Mouse = game.Players.LocalPlayer:GetMouse()
local CamlockState = true
local Prediction = 0.09
local HorizontalPrediction = 0.16 -- doesn't matter
local VerticalPrediction = 0.06 -- doesn't matter
local XPrediction = 0.176073 -- doesn't matter
local YPrediction = 0.167092 -- doesn't matter
local Smoothness = 0.0421
local Locked = true
getgenv().Key = "q"
----------------------------------------------------------------------------------------------------------------------------------------------
function FindNearestEnemy()
    local ClosestDistance, ClosestPlayer = math.huge, nil
    local CenterPosition =
        Vector2.new(
        game:GetService("GuiService"):GetScreenResolution().X / 2,
        game:GetService("GuiService"):GetScreenResolution().Y / 2
    )

    for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
        if Player ~= LocalPlayer then
            local Character = Player.Character
            if Character and Character:FindFirstChild("HumanoidRootPart") and Character.Humanoid.Health > 0 then
                local Position, IsVisibleOnViewport =
                    game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart.Position)

                if IsVisibleOnViewport then
                    local Distance = (CenterPosition - Vector2.new(Position.X, Position.Y)).Magnitude
                    if Distance < ClosestDistance then
                        ClosestPlayer = Character.HumanoidRootPart
                        ClosestDistance = Distance
                    end
                end
            end
        end
    end

    return ClosestPlayer
end
local enemy = nil
----------------------------------------------------------------------------------------------------------------------------------------------
RunService.Heartbeat:Connect(function()
    if CamlockState == true then
        if enemy then
            local camera = workspace.CurrentCamera
            local targetPosition = enemy.Position + enemy.Velocity * Prediction
            targetPosition = Vector3.new(targetPosition.X + XPrediction, targetPosition.Y + YPrediction, targetPosition.Z)
            
            -- Interpolate between the current camera position and the target position
            local currentPosition = camera.CFrame.Position
            local newPosition = currentPosition:Lerp(targetPosition, Smoothness)
            
            camera.CFrame = CFrame.new(newPosition, targetPosition)
        end
    end
end)
----------------------------------------------------------------------------------------------------------------------------------------------
Mouse.KeyDown:Connect(function(k)    
    if k == getgenv().Key then    
            Locked = not Locked    
            if Locked then    
                enemy = FindNearestEnemy()
                CamlockState = true
             else    
                if enemy ~= nil then    
                    enemy = nil    
                    CamlockState = false
                end    
            end    
    end    
end)
----------------------------------------------------------------------------------------------------------------------------------------------
local BladLock = Instance.new("ScreenGui") -- lmao skid
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Logo = Instance.new("ImageLabel")
local TextButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
----------------------------------------------------------------------------------------------------------------------------------------------
BladLock.Name = "BlackGuy"
BladLock.Parent = game.CoreGui
BladLock.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Frame.Parent = BladLock
Frame.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 128, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.133798108, 0, 0.20107238, 0)
Frame.Size = UDim2.new(0, 80, 0, 70)
Frame.Active = true
Frame.Draggable = true
local function TopContainer()
    Frame.Position = UDim2.new(0.5, -Frame.AbsoluteSize.X / 2, 0, -Frame.AbsoluteSize.Y / 2)
end
TopContainer()
Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(TopContainer)
UICorner.Parent = Frame
Logo.Name = "Logo"
Logo.Parent = Frame
Logo.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
Logo.BackgroundTransparency = 5.000
Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
Logo.BorderSizePixel = 0
Logo.Position = UDim2.new(0.326732665, 0, 0, 0)
Logo.Size = UDim2.new(0, 30, 0, 60)
Logo.Image = "rbxassetid://14953137188"
Logo.ImageTransparency = 117719
TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
TextButton.BackgroundTransparency = 5.000
TextButton.BorderColor3 = Color3.fromRGB(0, 129, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.0792079195, 0, 0.18571429, 0)
TextButton.Size = UDim2.new(0, 70, 0, 50)
TextButton.Font = Enum.Font.SourceSansSemibold
TextButton.Text = "Lol.xd CamLock On"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 24.000
TextButton.TextWrapped = true
local state = true
TextButton.MouseButton1Click:Connect(
    function()
        state = not state
        if not state then
            TextButton.Text = "Lol.xd CamLock On"
            CamlockState = true
            enemy = FindNearestEnemy()
            game.StarterGui:SetCore("SendNotification", {
                Title = "Lol.xd Camlock",
                Text = "Locking To"
            })
        else
            TextButton.Text = "Lol.xd CamLock Off"
            CamlockState = false
            enemy = nil
            game.StarterGui:SetCore("SendNotification", {
                Title = "Lol.xd Camlock";
                Text = "Unlocked";
                Icon = "rbxassetid://14953137188";
            })
        end
    end
)
UICorner_2.Parent = TextButton
Frame.Active = true
Frame.Draggable = true
----------------------------------------------------------------------------------------------------------------------------------------------
getgenv().Settings = {
    ["Silent"] = {
        ["Enabled"] = true,
        ["AimPart"] = "HumanoidRootPart",
        ["WallCheck"] = true,
        ["Visualize"] = false,
        ["Prediction"] = {
           ["Horizontal"] = 0.15,
           ["Vertical"] = 0.05,
        },
        ["AutoPrediction"] = {
            ["Enabled"] = true,
            ["Type"] = "Normal", -- Options: Normal, Custom
           ["ping20_30"] = 0.10087127181718181,
           ["ping30_40"] = 0.11027333333333333,
           ["ping40_50"] = ,
           ["ping50_60"] = 0.12109333333333334,
           ["ping60_70"] = 0.13731,
           ["ping70_80"] = 0.13951,
           ["ping80_90"] = 0.13834833333333335,
           ["ping90_100"] = 0.13834833333333335,
           ["ping100_110"] = 0.14437333333333335,
           ["ping110_120"] = 0.15053500000000003,
           ["ping120_130"] = 0.16326833333333332,
           ["ping130_140"] = 0.1637,
           ["ping140_150"] = 0.173,
           ["ping150_160"] = 0.1714,
           ["ping160_170"] = 0.1863,
           ["ping170_180"] = 0.1872,
           ["ping180_190"] = 0.1848,
           ["ping190_200"] = 0.1865,
        },
        ["Mode"] = "Namecall", -- Options: index, namecall
    },
    ["FOV"] = {
        ["Enabled"] = false,
        ["Size"] = 35,
        ["Filled"] = false,
        ["Thickness"] = 0.66,
        ["Transparency"] = 0.9,
        ["Color"] = Color3.fromRGB(0, 255, 0),
    },
    ["Camlock"] = { 
        ["Enabled"] = true,
        ["AimPart"] = "HumanoidRootPart",
        ["Prediction"] = { 0.1,
           ["Horizontal"] = 0.185,
           ["Vertical"] = 0.1,
        },
        ["Shake"] = {
            ["X"] = 10,
            ["Y"] = 0,
            ["Z"] = 0, -- Don't touch
        },
    },
    ["Misc"] = {
        ["NoDelay"] = true,
        ["AutoReload"] = false,
        ["AutoAir"] = {
            ["Enabled"] = true,
            ["Interval"] = 0.5,
        },
        ["CMDS"] = { 
            ["Enabled"] = false,
            ["FOVPrefix"] = "B",
            ["Prediction"] = "A",
        },
    },
    ["Resolution"] = {
        ["Value"] = 1,
    },
    ["Resolvers"] = {  -- Fully customizable
        ["Enabled"] = false,
        ["AutoDetect"] = false,
        ["Type"] = "Recalculator",
    },
    ["Visuals"] = {
        ["Ambient"] = {
            ["Enabled"] = false,
            ["Color"] = Color3.fromRGB(0, 255, 0),
        },
        ["OutDoor Ambient"] = {
            ["Enabled"] = false,
            ["Color"] = Color3.fromRGB(0, 255, 0)
        },
        ["Fog Modifications"] = {
            ["Enabled"] = false,
            ["Color"] = Color3.fromRGB(0, 255, 0),
            ["Start"] = 15,
            ["End"] = 100 
        },
        ["ColorCorrection"] = {
            ["Enabled"] = false,
            ["Brightness"] = 0,
            ["Saturation"] = 5,
            ["Contrast"] = 2,
        },
    },
}

-- // Nigga skidded fearlas ðŸ˜­ðŸ™
loadstring(game:HttpGet("https://raw.githubusercontent.com/bobbbb-b/B/main/77_SJQ0ZC.lua"))()