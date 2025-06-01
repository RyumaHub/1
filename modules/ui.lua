return function()
  
    local Window = getgenv().Rayfield:CreateWindow({
        Name = "RYUMA HUB",
        Icon = "code-xml",
        LoadingTitle = "RYUMA HUB",
        LoadingSubtitle = "By RYUMA",
        Theme = "DarkBlue",
        DisableRayfieldPrompts = true,
        DisableBuildWarnings = true,
        ConfigurationSaving = {
            Enabled = true,
            FileName = "Hades RNG RYUMA HUB"
        },
        Discord = {
            Enabled = false,
            Invite = "noinvitelink",
            RememberJoins = true
        },
        KeySystem = false,
        KeySettings = {
            Title = "Untitled",
            Subtitle = "Key System",
            Note = "No method of obtaining the key is provided",
            FileName = "Key",
            SaveKey = true,
            GrabKeyFromSite = false,
            Key = {"Hello"}
        }
    })

    getgenv().Tabs = {
        Main = Window:CreateTab("Main", "layout-dashboard"),
        Miner = Window:CreateTab("Miner", "pickaxe"),
        Craft = Window:CreateTab("Craft", "hammer"),
        Shop = Window:CreateTab("Mystery Shop", "store"),
        Biomes = Window:CreateTab("Biomes", "map"),
        Player = Window:CreateTab("Local Player", "user"),
    }
end
