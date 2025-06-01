local Getgenvs = loadstring(game:HttpGet("https://pastebin.com/raw/zkifvC0h"))()
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

getgenv().runService = game:GetService("RunService")
getgenv().Rayfield = Rayfield

loadstring(game:HttpGet("https://raw.githubusercontent.com/RyumaHub/1/main/modules/ui.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RyumaHub/1/main/modules/features.lua"))()

Rayfield:LoadConfiguration()
