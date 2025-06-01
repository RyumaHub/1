return function()
local Tabs = getgenv().Tabs

local Toggle2 = Tabs.Main:CreateToggle({
    Name = "Auto Collect Bring✅ + GwaGwa✅ Pray✅ Lunaris✅ Maxwell❌ Doge✅",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(value)
        getgenv().bringEnabled = value
        if getgenv().bringEnabled then
            getgenv().bringLoop = getgenv().runService.Heartbeat:Connect(function()
                getgenv().bringObjectsToPlayer()
            end)
        else
            if getgenv().bringLoop then
                getgenv().bringLoop:Disconnect()
                getgenv().bringLoop = nil
            end
        end
    end,
})

local Toggle3 = Tabs.Main:CreateToggle({
    Name = "Auto Collect tp✅ + GwaGwa✅ Pray✅ Lunaris✅ Maxwell✅ Doge✅",
    CurrentValue = false,
    Flag = "Toggle3",
    Callback = function(value)
        getgenv().tpEnabled = value
        if getgenv().tpEnabled then
            getgenv().tpLoop = getgenv().runService.Heartbeat:Connect(function()
                getgenv().teleportToObjects()
            end)
        else
            if getgenv().tpLoop then
                getgenv().tpLoop:Disconnect()
                getgenv().tpLoop = nil
            end
        end
    end,
})

local Toggle4 = Tabs.Main:CreateToggle({
    Name = "Fast Roll BETA",
    CurrentValue = false,
    Flag = "Toggle4",
    Callback = function(value)
        if value then
            getgenv().originalRollSpeed = game:GetService("Players").LocalPlayer:GetAttribute("RollSpeed") or 0
            game:GetService("Players").LocalPlayer:SetAttribute("RollSpeed", math.huge)
        else
            game:GetService("Players").LocalPlayer:SetAttribute("RollSpeed", getgenv().originalRollSpeed)
        end
    end,
})

local Toggle5 = Tabs.Miner:CreateToggle({
    Name = "Auto Claim BETA",
    CurrentValue = false,
    Flag = "Toggle5",
    Callback = function(value)
        getgenv().ToggleClaim = value
        if value then task.spawn(getgenv().autoClaim) end
    end,
})

local Toggle6 = Tabs.Miner:CreateToggle({
    Name = "Anti Bugs",
    CurrentValue = false,
    Flag = "Toggle6",
    Callback = function(value)
        getgenv().toggleAntiBugs(value)
    end,
})

local Toggle7 = Tabs.Craft:CreateToggle({
    Name = "Auto Reality I",
    CurrentValue = false,
    Flag = "Toggle7",
    Callback = function(Value)
        getgenv().AutoReality1 = Value  
        if Value then
            task.spawn(function()
                while getgenv().AutoReality1 do  
                    local requests1 = {
                        { "AddItem", "Reality I", "Pray", 1 },
                        { "AddItem", "Reality I", "BINARY", 1 },
                        { "AddItem", "Reality I", "BINARYX",1 }
                    }

                    for _, args in ipairs(requests1) do
                        game:GetService("ReplicatedStorage").Networks.ServerF:InvokeServer(args)
                    end
                    task.wait()
                end
            end)
        end
    end,
})

local Toggle8 = Tabs.Craft:CreateToggle({
    Name = "Auto Reality II",
    CurrentValue = false,
    Flag = "Toggle8",
    Callback = function(Value)
        getgenv().AutoReality2 = Value  
        if Value then
            task.spawn(function()
                while getgenv().AutoReality2 do  
                    local requests2 = {
                        { "AddItem", "Reality I", "Pray", 1 },
                        { "AddItem", "Reality I", "BINARY", 1 },
                        { "AddItem", "Reality I", "BINARYX", 1 },
                        { "AddItem", "Reality II", "Reality I", 1 },
                        { "AddItem", "Reality II", "Pray", 1 },
                        { "AddItem", "Reality II", "BINARY", 1 }
                    }

                    for _, args in ipairs(requests2) do
                        game:GetService("ReplicatedStorage").Networks.ServerF:InvokeServer(args)
                    end
                    task.wait()
                end
            end)
        end
    end,
})

local Paragraph = Tabs.Shop:CreateParagraph({Title = "Kvjesm Status", Content = ""})
task.spawn(function()
    while true do
        local content = "🔴"
        if workspace:FindFirstChild("NPC") and workspace.NPC:FindFirstChild("Merchant") then
            if workspace.NPC.Merchant:FindFirstChild("Kvjesm") then
                content = "🟢"
            end
        end

        Paragraph:Set({Title = "Kvjesm Status", Content = content})
        task.wait(1)
    end
end)

local Button = Tabs.Shop:CreateButton({
    Name = "TP to Kvjesm",
    Callback = function()
        local kvjesm = workspace:FindFirstChild("NPC") and workspace.NPC:FindFirstChild("Merchant") and workspace.NPC.Merchant:FindFirstChild("Kvjesm")
        if kvjesm and kvjesm:IsA("Model") and kvjesm:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character:PivotTo(kvjesm.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0))
        end
    end,
})

local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://176820116"
Sound.Name = "BiomeSound"
Sound.Looped = true
Sound.Volume = 1
Sound.Parent = workspace

local Biome = game:GetService("ReplicatedStorage").GameData.Biome
local Connection

local Toggle10 = Tabs.Biomes:CreateToggle({
    Name = "Biome Notification",
    CurrentValue = false,
    Flag = "Toggle10",
    Callback = function(Value)
        if Value then
            Connection = Biome:GetPropertyChangedSignal("Value"):Connect(function()
                local biomeValue = Biome.Value
                if biomeValue:find("Void") or biomeValue:find("Nightmare") or biomeValue:find("Heaven") or biomeValue:find("Hell") or biomeValue:find("Corecility") or biomeValue:find("Paranoia") then
                    if not Sound.IsPlaying then
                        Sound:Play()
                    end
                else
                    Sound:Stop()
                end
            end)

            if Biome.Value:find("Void") or Biome.Value:find("Nightmare") or Biome.Value:find("Heaven") or Biome.Value:find("Hell") or Biome.Value:find("Corecility") or Biome.Value:find("Paranoia") then
                Sound:Play()
            end
        else
            if Connection then
                Connection:Disconnect()
                Connection = nil
            end
            Sound:Stop()
        end
    end,
})

local VU = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VU:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

local Toggle11 = Tabs.Player:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Flag = "Toggle11",
    Callback = function(Value)
        if Value then
            AntiAFKConnection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                VU:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                wait(1)
                VU:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
        else
            if AntiAFKConnection then
                AntiAFKConnection:Disconnect()
            end
        end
    end,
})

local Button = Tabs.Player:CreateButton({
    Name = "Ascended Gwa Gwa Esp",
    Callback = function()
        local p = game:GetService("Players").LocalPlayer
        local c = p.Character or p.CharacterAdded:Wait()
        local h = game:GetService("ReplicatedStorage"):WaitForChild("Tools"):WaitForChild("Gwas"):WaitForChild("Ascended Gwa Gwa"):WaitForChild("Handle"):Clone()
        h.Name, h.Parent = "Ascended Gwa Gwa", c
    end,
})
end
