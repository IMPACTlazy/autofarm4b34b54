-- ✅ Key System
local VALID_KEYS = {
    "IMPACT-NAHE1452-5G",
    "IMPACT-NAHE2863-7K",
    "IMPACT-NAHE3974-2X",
}

local userKey = getgenv().KEY or ""
local valid = false
for _, k in ipairs(VALID_KEYS) do
    if k == userKey then valid = true break end
end

if not valid then
    error("❌ Key ไม่ถูกต้อง! ติดต่อ IMPACTlazy เพื่อขอ Key")
    return
end

-- ✅ Key System
local VALID_KEYS = {
    "IMPACT-NAHE1452-5G",
    "IMPACT-NAHE2863-7K",
    "IMPACT-NAHE3974-2X",
}

local userKey = getgenv().KEY or ""
local valid = false
for _, k in ipairs(VALID_KEYS) do
    if k == userKey then valid = true break end
end

if not valid then
    error("❌ Key ไม่ถูกต้อง! ติดต่อ IMPACTlazy เพื่อขอ Key")
    return
end

-- ✅ Anti-Detect
local RunService = game:GetService("RunService")
local count = 0
local conn

conn = RunService.Heartbeat:Connect(function()
    count += 1
    if count >= 10 then conn:Disconnect() end
end)

while count < 10 do RunService.Heartbeat:Wait() end
if count < 10 then error("detected") return end

-- ✅ Services
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local LocalPlayer = LP
local placeId = game.PlaceId
local jobId = game.JobId
local RS = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local CombatRemote = RS:WaitForChild("CombatSystem"):WaitForChild("Remotes"):WaitForChild("RequestHit")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local GuiService = game:GetService("GuiService")
local TeleportService = game:GetService("TeleportService")
local privateServerId = game.PrivateServerId
local QuestModule = require(ReplicatedStorage.Modules.QuestConfig)
local quests = QuestModule.RepeatableQuests
local QuestEvent = ReplicatedStorage.RemoteEvents.QuestAccept
local Event = RS:WaitForChild("RemoteEvents"):WaitForChild("AllocateStat")
local Data = LP:WaitForChild("Data")
local StatPoints = Data:WaitForChild("StatPoints")
local MerchantConfig = require(game:GetService("ReplicatedStorage").Modules.MerchantConfig)
local PurchaseRemote = game:GetService("ReplicatedStorage").Remotes.MerchantRemotes.PurchaseMerchantItem
local HttpService = game:GetService("HttpService")
local remotes = ReplicatedStorage:WaitForChild("Remotes")
local requestRemote = remotes:WaitForChild("RequestInventory")
local updateRemote = remotes:WaitForChild("UpdateInventory")
local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
local ItemRarityConfig = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("ItemRarityConfig"))
local LoadoutEvent = ReplicatedStorage.RemoteEvents.LoadoutLoad

_G.selectedMerchantItems = {}
_G.AutoBuyMerchant = false
_G.PrioriySystem = false
_G.PrioriySystem2 = false
_G.AutoBuildSwitch = false
_G.LuckBuild = 1
_G.DamageBuild = 2
_G.BuildThreshold = 15
_G.ModeAT = "Above"
_G.Adis = 11
_G.SelectModeTP = "Instant"
_G.TPDelay = 0.15
_G.TPDelayRandom = 0.08
_G.TPStepMode = true
_G.TPSteps = 2
_G.SpeedTweenS = 190
_G.selectedTrait = {}
_G.AutoRerollRace = false
_G.RollDelay = 0.2
_G.AutoRerollClan = false
_G.ClanRollDelay = 0.2

local IslandPositions = {
    ["Starter"] = { Position = Vector3.new(140.46,16.02,-232.60), Distance = 300 },
    ["Jungle"] = { Position = Vector3.new(-549.45,-1.63,450.97), Distance = 250 },
    ["Desert"] = { Position = Vector3.new(-858.28,7.39,-423.21), Distance = 180 },
    ["Snow"] = { Position = Vector3.new(-404.00,8.77,-1108.40), Distance = 350 },
    ["Sailor"] = { Position = Vector3.new(241.33,58.22,878.63), Distance = 320 },
    ["Shibuya"] = { Position = Vector3.new(1634.82,94.87,249.17), Distance = 700 },
    ["HuecoMundo"] = { Position = Vector3.new(-548.87,0.32,1172.33), Distance = 400 },
    ["Boss"] = { Position = Vector3.new(768.42,-0.66,-1087.13), Distance = 180 },
    ["Shinjuku"] = { Position = Vector3.new(320.87,-4.17,-2004.63), Distance = 750 },
    ["Slime"] = { Position = Vector3.new(-1183.33,44.49,212.57), Distance = 400 },
    ["Academy"] = { Position = Vector3.new(963.08,2.26,1327.11), Distance = 250 },
    ["Judgement"] = { Position = Vector3.new(-1244.09,77.01,-1236.86), Distance = 420 },
    ["SoulSociety"] = { Position = Vector3.new(-1303.72,1624.63,1672.49), Distance = 170 },
}

local ListTrade = {
    ["Blessed Maiden"] = {{Name="Aero Core",Amount=3},{Name="Celestial Mark",Amount=1},{Name="Gale Essence",Amount=8},{Name="Tide Remnant",Amount=14},{Name="Tempest Relic",Amount=25}},
    ["Gojo V2"] = {{Name="Six Eye",Amount=6},{Name="Reversal Pulse",Amount=9},{Name="Blue Singularity",Amount=6},{Name="Infinity Essence",Amount=1}},
    ["Sukuna V2"] = {{Name="Cursed Flesh",Amount=1},{Name="Malevolent Soul",Amount=3},{Name="Vessel Ring",Amount=7},{Name="Awakened Cursed Finger",Amount=20}},
    ["Ichigo"] = {{Name="Boss Ticket",Amount=500}},
    ["Rimuru"] = {{Name="Sage Pulse",Amount=9},{Name="Tempest Seal",Amount=6},{Name="Slime Remnant",Amount=3},{Name="Slime Core",Amount=1}},
    ["Anos"] = {{Name="Calamity Seal",Amount=65},{Name="Demonic Fragment",Amount=12},{Name="Demonic Shard",Amount=6},{Name="Destruction Eye",Amount=2},{Name="Imperial Mark",Amount=1}},
    ["Aizen V2"] = {{Name="Evolution Fragment",Amount=1},{Name="Transcendent Core",Amount=3},{Name="Divinity Essence",Amount=8},{Name="Fusion Ring",Amount=15},{Name="Chrysalis Sigil",Amount=75}},
    ["Yamato"] = {{Name="Azure Heart",Amount=1},{Name="Silent Storm",Amount=3},{Name="Yamato",Amount=7},{Name="Frozen Will",Amount=14}},
}

local TradeNames = {}
for name,_ in pairs(ListTrade) do table.insert(TradeNames, name) end

-- ✅ Safety Mode
local function SafetyMode()
    local BlacklistedUsers = {
        [2595714482]=true,[516173765]=true,[4512218864]=true,
        [1743329681]=true,[653208846]=true,[3226663238]=true,
        [1994122448]=true,[2925788551]=true,[3017035996]=true,
        [377698788]=true,[2829959745]=true
    }
    local function Check(p) if BlacklistedUsers[p.UserId] then game:Shutdown() end end
    for _,p in ipairs(Players:GetPlayers()) do Check(p) end
    Players.PlayerAdded:Connect(Check)
end

-- ✅ File counter
local fileName = "Impact Hub/Config/TotalExecution.json"
if not isfile(fileName) then writefile(fileName, "0") end
local currentValue = tonumber(readfile(fileName)) or 0
currentValue = currentValue + 1
writefile(fileName, tostring(currentValue))

local selectedWeapon = "None"

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- ✅ Helper Functions
local function QuestR(a)
    ReplicatedStorage.RemoteEvents.QuestAccept:FireServer(a)
end

local function GetClosestIsland(npc)
    for islandName, data in pairs(IslandPositions) do
        if (npc - data.Position).Magnitude <= data.Distance then
            return islandName, data
        end
    end
    return nil, nil
end

local PortalRemote = ReplicatedStorage.Remotes:WaitForChild("TeleportToPortal")
local function TeleportToIsland(islandName)
    if not islandName then return end
    PortalRemote:FireServer(islandName)
    local char = LP.Character or LP.CharacterAdded:Wait()
    repeat task.wait() until char:FindFirstChild("HumanoidRootPart")
end

local function formatNumber(n)
    n = tonumber(n) or 0
    local abs = math.abs(n)
    local function clean(num) return (string.format("%.2f", num)):gsub("%.?0+$", "") end
    if abs >= 1e12 then return clean(n/1e12).."T"
    elseif abs >= 1e9 then return clean(n/1e9).."B"
    elseif abs >= 1e6 then return clean(n/1e6).."M"
    elseif abs >= 1e3 then return clean(n/1e3).."K"
    else return tostring(n) end
end

local function sendWebhook(itemsText, WEBHOOK_URL)
    local level = player.Data.Level.Value
    local money = formatNumber(player.Data.Money.Value)
    local gems = formatNumber(player.Data.Gems.Value)
    local data = {
        ["username"] = "Impact Hub!",
        ["avatar_url"] = "https://i.imgur.com/SGVO85F.png",
        ["embeds"] = {{
            ["title"] = "Player Inventory Data",
            ["description"] = "**Player:** "..game.Players.LocalPlayer.Name.."\n⭐ Level: **"..level.."** 💰 Money: **"..money.."** 💎 Gems: **"..gems.."**\n\n📦 **Items**\n```"..itemsText.."```",
            ["color"] = 65280
        }}
    }
    local requestFunc = http_request or request or syn.request
    if requestFunc then
        requestFunc({ Url=WEBHOOK_URL, Body=HttpService:JSONEncode(data), Method="POST", Headers={["Content-Type"]="application/json"} })
    end
end

local function manualTrigger(link)
    local connection
    connection = updateRemote.OnClientEvent:Connect(function(category, data)
        if category ~= "Items" or type(data) ~= "table" then return end
        connection:Disconnect()
        local tierData = {}
        local tierOrder = {"Secret","Mythical","Legendary","Epic","Rare","Uncommon","Common"}
        for _, item in pairs(data) do
            if type(item) == "table" and item.name then
                local tier = ItemRarityConfig:GetRarity(item.name) or "Common"
                tierData[tier] = tierData[tier] or {}
                tierData[tier][item.name] = (tierData[tier][item.name] or 0) + (item.quantity or 1)
            end
        end
        local itemsText = ""
        for _, tier in ipairs(tierOrder) do
            if tierData[tier] then
                itemsText = itemsText.."📦 "..tier.." Items\n"
                for name, qty in pairs(tierData[tier]) do
                    itemsText = itemsText.."- "..name.." x"..qty.."\n"
                end
                itemsText = itemsText.."\n"
            end
        end
        sendWebhook(itemsText == "" and "Empty" or itemsText, link)
    end)
    requestRemote:FireServer()
end

local function IsBusoActive()
    local char = player.Character
    if not char then return false end
    for _, part in ipairs({char:FindFirstChild("Right Arm"), char:FindFirstChild("Left Arm")}) do
        if part and part:IsA("Part") then
            local c = part.Color
            if c.R == 0 and c.G == 0 and c.B == 0 then return true end
        end
    end
    return false
end

local function BuildNPCLevelMap()
    local levelMap = {}
    for _, questData in pairs(quests) do
        local lvl = questData.recommendedLevel
        if lvl and questData.requirements then
            local function process(req)
                if type(req) == "table" and req.npcType then
                    local n = req.npcType
                    if not levelMap[n] or lvl > levelMap[n] then levelMap[n] = lvl end
                end
            end
            if questData.requirements.npcType then process(questData.requirements)
            else for _, req in pairs(questData.requirements) do process(req) end end
        end
    end
    return levelMap
end

local function getNPC(kkj)
    local seen = {}
    local npcsFolder = Workspace:FindFirstChild("NPCs")
    if not npcsFolder then return {"None"} end
    local levelMap = BuildNPCLevelMap()
    local entries = {}
    for _, npc in ipairs(npcsFolder:GetChildren()) do
        if npc:FindFirstChild("Humanoid") then
            local rawName = npc.Name
            if not kkj and rawName:find("_") then continue end
            if rawName:lower():find("boss") then continue end
            local cleanName = rawName:gsub("%d+",""):match("^%s*(.-)%s*$")
            if cleanName ~= "" and not seen[cleanName] then
                seen[cleanName] = true
                table.insert(entries, {name=cleanName, level=levelMap[cleanName] or 9999})
            end
        end
    end
    table.sort(entries, function(a,b) return a.level == b.level and a.name < b.name or a.level < b.level end)
    local list = {"None"}
    _G.NPCLabelToName = _G.NPCLabelToName or {}
    for _, e in ipairs(entries) do
        local label = e.level ~= 9999 and string.format("[Lv.%d] %s", e.level, e.name) or e.name
        table.insert(list, label)
        _G.NPCLabelToName[label] = e.name
        _G.NPCLabelToName[e.name] = e.name
    end
    return list
end

local function getBossNPC()
    local seen = {}
    local list = {"None"}
    local npcsFolder = Workspace:FindFirstChild("NPCs")
    if not npcsFolder then return list end
    local bossNames = {}
    for _, npc in ipairs(npcsFolder:GetChildren()) do
        if npc:FindFirstChild("Humanoid") and npc.Name:lower():find("boss") then
            local cleanName = npc.Name:gsub("%d+",""):match("^%s*(.-)%s*$")
            if cleanName ~= "" and not seen[cleanName] then
                seen[cleanName] = true
                table.insert(bossNames, cleanName)
            end
        end
    end
    table.sort(bossNames)
    for _, n in ipairs(bossNames) do table.insert(list, n) end
    return list
end

local function ResolveMobName(label)
    if _G.NPCLabelToName and _G.NPCLabelToName[label] then return _G.NPCLabelToName[label] end
    return label:match("^%[Lv%.[%d]+%] (.+)$") or label
end

local function findNPC(name, mode)
    if name == "None" then return nil end
    local npcsFolder = Workspace:FindFirstChild("NPCs")
    if not npcsFolder then return nil end
    for _, npc in pairs(npcsFolder:GetChildren()) do
        local hum = npc:FindFirstChild("Humanoid")
        if not hum or hum.Health <= 0 then continue end
        if mode == "Boss" then
            if npc.Name == name then return npc end
        else
            if mode ~= "IncludeUnderscore" and npc.Name:find("_") then continue end
            local processedName = npc.Name:gsub("%d+",""):match("^%s*(.-)%s*$")
            if processedName == name then return npc end
        end
    end
    return nil
end

local function getAllWeapons()
    local weapons = {"None"}
    local backpack = LP:FindFirstChild("Backpack")
    local char = LP.Character
    if backpack then for _, tool in pairs(backpack:GetChildren()) do if tool:IsA("Tool") then table.insert(weapons, tool.Name) end end end
    if char then for _, tool in pairs(char:GetChildren()) do if tool:IsA("Tool") and not table.find(weapons, tool.Name) then table.insert(weapons, tool.Name) end end end
    return weapons
end

local function AktifSkill()
    if _G.AutoSkill then
        local abilityRemote = ReplicatedStorage.AbilitySystem.Remotes.RequestAbility
        if _G.SkillZ then abilityRemote:FireServer(1) end
        if _G.SkillX then abilityRemote:FireServer(2) end
        if _G.SkillC then abilityRemote:FireServer(3) end
        if _G.SkillV then abilityRemote:FireServer(4) end
        if _G.SkillF then abilityRemote:FireServer(5) end
    end
end

local isProcessing = false

local function GetCurrentQuestTitle()
    local gui = player.PlayerGui:FindFirstChild("QuestUI")
    if not gui then return nil end
    local questFrame = gui:FindFirstChild("Quest")
    if not questFrame or not questFrame.Visible then return nil end
    local success, title = pcall(function()
        return questFrame.Quest.Holder.Content.QuestInfo.QuestTitle.QuestTitle.Text
    end)
    return success and title or nil
end

local function GetBestQuest()
    if isProcessing then return end
    local levelValue = player.Data.Level.Value
    local bestQuestName, bestNpcType, maxLevelFound = nil, nil, -1
    for questName, questData in pairs(quests) do
        local reqLevel = questData.recommendedLevel
        if reqLevel and levelValue >= reqLevel and reqLevel > maxLevelFound then
            maxLevelFound = reqLevel
            bestQuestName = questName
            if questData.requirements then
                if questData.requirements.npcType then bestNpcType = questData.requirements.npcType
                else for _, req in pairs(questData.requirements) do if type(req)=="table" and req.npcType then bestNpcType = req.npcType break end end end
            end
        end
    end
    local currentQuestTitle = GetCurrentQuestTitle()
    if currentQuestTitle then
        if bestQuestName and currentQuestTitle ~= quests[bestQuestName].title then
            isProcessing = true
            pcall(function() firesignal(player.PlayerGui.QuestUI.Quest.Quest.Holder.Content.Exit.CloseButton.MouseButton1Click) end)
            task.wait(1)
            isProcessing = false
            return nil, nil
        end
        return bestQuestName, bestNpcType
    end
    if bestQuestName then
        isProcessing = true
        QuestR(bestQuestName)
        task.wait(1)
        isProcessing = false
    end
    return bestQuestName, bestNpcType
end

local function GetNPCOptions()
    local npcFolder = workspace:WaitForChild("ServiceNPCs")
    local npcOptions = {}
    for _, obj in ipairs(npcFolder:GetChildren()) do
        if obj:IsA("Model") then table.insert(npcOptions, obj.Name) end
    end
    table.sort(npcOptions)
    return npcOptions
end

local function GetAllMerchantItems()
    local options = {}
    for itemName, _ in pairs(MerchantConfig.ITEMS) do table.insert(options, itemName) end
    table.sort(options)
    return options
end

local GetStockRemote = ReplicatedStorage.Remotes.MerchantRemotes.GetMerchantStock
_G.MerchantStockCache = {}

local function CheckAndBuy()
    if not _G.selectedMerchantItems or #_G.selectedMerchantItems == 0 then return end
    local merchantStock = _G.MerchantStockCache
    if not merchantStock then return end
    if table.find(_G.selectedMerchantItems, "All") then
        for itemName, data in pairs(merchantStock) do
            if data.stock and data.stock > 0 then PurchaseRemote:InvokeServer(itemName, 1) end
        end
        return
    end
    for _, selectedItem in ipairs(_G.selectedMerchantItems) do
        local data = merchantStock[selectedItem]
        if data and data.stock and data.stock > 0 then PurchaseRemote:InvokeServer(selectedItem, 1) end
    end
end

local function GetMerchantStockNames()
    local response = GetStockRemote:InvokeServer()
    if not response or not response.stock then return "Loading..." end
    _G.MerchantStockCache = response.stock
    local text = ""
    for itemName, data in pairs(response.stock) do
        local p = (data.currency == "Money") and "#1AFF00" or "#00FFF7"
        text = text..itemName.." [ <b><font color=\"#FF0000\"> x"..data.stock.." </font></b> | <b><font color=\""..p.."\"> "..data.price.." "..data.currency.." </font></b> ]\n"
    end
    return text
end

local function GetIslandOptions()
    local PortalConfig = require(ReplicatedStorage:WaitForChild("PortalConfig"))
    local islandOptions = {}
    for portalId, _ in pairs(PortalConfig.Portals) do table.insert(islandOptions, portalId) end
    table.sort(islandOptions)
    return islandOptions
end

local ClanConfig = require(ReplicatedStorage.Modules.ClanConfig)
local function GetAllClansFormatted()
    local list = {}
    _G.ClanDropdownMap = {}
    for clanName, clanData in pairs(ClanConfig.Clans) do
        local formatted = clanName.." -> "..(clanData.rarity or "Common")
        table.insert(list, formatted)
        _G.ClanDropdownMap[formatted] = clanName
    end
    table.sort(list)
    return list
end

local function GetClan()
    local data = ReplicatedStorage.RemoteEvents.GetPlayerStats:InvokeServer()
    if not data then return nil end
    return data.Inventory and data.Inventory.Equipped and data.Inventory.Equipped.Clan
end

local UseItemRemote = ReplicatedStorage.Remotes.UseItem

local function IsTargetClan(currentClan)
    if not _G.selectedClans then return false end
    for _, target in pairs(_G.selectedClans) do if currentClan == target then return true end end
    return false
end

local function AutoRerollClan()
    task.spawn(function()
        while _G.AutoRerollClan do
            local currentClan = GetClan()
            if IsTargetClan(currentClan) then _G.AutoRerollClan = false break end
            UseItemRemote:FireServer("Use", "Clan Reroll", 1)
            task.wait(_G.ClanRollDelay)
        end
    end)
end

function BoostFps()
    local Lighting = game:GetService("Lighting")
    local Terrain = workspace:FindFirstChildOfClass("Terrain")
    for _,v in pairs(Lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then v:Destroy() end
    end
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e10
    Lighting.Brightness = 1
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then v.Material = Enum.Material.Plastic v.Reflectance = 0 end
        if v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1 end
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then v.Enabled = false end
    end
    if Terrain then Terrain.WaterWaveSize=0 Terrain.WaterWaveSpeed=0 Terrain.WaterReflectance=0 Terrain.WaterTransparency=1 end
end

local TraitConfig = require(ReplicatedStorage.Modules.TraitConfig)
_G.selectedTrait = {}
local DropdownMap = {}

local function GetAllTraitsFormatted()
    local options = {}
    for traitName, traitData in pairs(TraitConfig.Traits) do
        local formatted = traitName.." -> "..traitData.Rarity
        table.insert(options, formatted)
        DropdownMap[formatted] = traitName
    end
    table.sort(options)
    return options
end

local function GetEquippedTrait()
    local data = ReplicatedStorage.RemoteEvents.GetPlayerStats:InvokeServer()
    return data and data.Trait or nil
end

local function CheckTrait()
    if not _G.selectedTrait or #_G.selectedTrait == 0 then return end
    local equippedTrait = GetEquippedTrait()
    if not equippedTrait then return end
    for _, selected in pairs(_G.selectedTrait) do
        if selected == equippedTrait then _G.StartGachaTRAIT = false return true end
    end
    ReplicatedStorage.RemoteEvents.TraitReroll:FireServer()
    return false
end

local function equipWeapon(toolName)
    if not toolName or toolName == "None" then return end
    local char = LP.Character
    local humanoid = char and char:FindFirstChild("Humanoid")
    if not humanoid then return end
    if char:FindFirstChild(toolName) then return end
    local tool = LP.Backpack:FindFirstChild(toolName)
    if tool then humanoid:EquipTool(tool) task.wait() end
end

local RaceConfig = require(ReplicatedStorage.Modules.RaceConfig)
local function GetRace()
    local data = ReplicatedStorage.RemoteEvents.GetPlayerStats:InvokeServer() or {}
    return data.Inventory and data.Inventory.Equipped and data.Inventory.Equipped.Race
end

local function GetAllRacesFormatted()
    local list = {}
    _G.RaceDropdownMap = {}
    for raceName, raceData in pairs(RaceConfig.Races) do
        local formatted = raceName.." -> "..(raceData.rarity or "Common")
        table.insert(list, formatted)
        _G.RaceDropdownMap[formatted] = raceName
    end
    table.sort(list)
    return list
end

local function NormalizeToTable(value)
    if not value then return {} end
    if typeof(value) == "table" then return value end
    return {value}
end

local function IsTargetRace(currentRace)
    if not _G.selectedRaces then return false end
    for _, target in pairs(_G.selectedRaces) do if currentRace == target then return true end end
    return false
end

local function AutoRerollRace()
    task.spawn(function()
        while _G.AutoRerollRace do
            local currentRace = GetRace()
            if IsTargetRace(currentRace) then _G.AutoRerollRace = false break end
            UseItemRemote:FireServer("Use", "Race Reroll", 1)
            task.wait(_G.RollDelay)
        end
    end)
end

local noclip = false
local noclipConn
local function SetNoclip(state)
    noclip = state
    if noclip then
        noclipConn = RunService.Stepped:Connect(function()
            local char = LP.Character
            if char then for _, part in ipairs(char:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end end
        end)
    else
        if noclipConn then noclipConn:Disconnect() noclipConn = nil end
    end
end

local TweenService = game:GetService("TweenService")
local lastTPTime = 0

function TPInstant(Pos)
    local char = LP.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return end
    local hrpX = char:FindFirstChild("HumanoidRootPart")
    if not hrpX then return end
    local now = tick()
    local delay = _G.TPDelay + (math.random() * _G.TPDelayRandom)
    if now - lastTPTime < delay then task.wait(delay - (now - lastTPTime)) end
    if _G.TPStepMode and _G.TPSteps > 1 then
        local startPos = hrpX.CFrame
        for i = 1, _G.TPSteps - 1 do
            local midPos = startPos:Lerp(Pos, i / _G.TPSteps)
            hrpX.AssemblyLinearVelocity = Vector3.zero
            hrpX.AssemblyAngularVelocity = Vector3.zero
            hrpX.CFrame = midPos
            task.wait(0.05 + math.random() * 0.03)
        end
    end
    hrpX.AssemblyLinearVelocity = Vector3.zero
    hrpX.AssemblyAngularVelocity = Vector3.zero
    hrpX.CFrame = Pos
    lastTPTime = tick()
end

function TP(Pos) TPInstant(Pos) end

local function getAttackPos()
    local mode = _G.ModeAT or "Above"
    local d = _G.Adis or 11
    if mode == "Above" then return CFrame.new(0, d, 0) * CFrame.Angles(math.rad(-90),0,0)
    elseif mode == "Below" then return CFrame.new(0, -d, 0) * CFrame.Angles(math.rad(90),0,0)
    elseif mode == "Behind" then return CFrame.new(0, 0, d)
    else return CFrame.new(0,0,0) end
end

local TELEPORT_COOLDOWN = 1
local CurrentBuild = nil
local function LoadBuild(id)
    if CurrentBuild == id then return end
    CurrentBuild = id
    LoadoutEvent:FireServer(id)
end

local lastCheck = 0
local function CheckBuildByHP(target)
    if not _G.AutoBuildSwitch or not target then return end
    if tick() - lastCheck < 0.2 then return end
    lastCheck = tick()
    local hum = target:FindFirstChild("Humanoid")
    if not hum then return end
    local percent = (hum.Health / hum.MaxHealth) * 100
    if percent <= _G.BuildThreshold then LoadBuild(_G.LuckBuild) else LoadBuild(_G.DamageBuild) end
end

local tanggal = os.date("%d/%m/%Y")
local MarketplaceService = game:GetService("MarketplaceService")
local infoXXX = MarketplaceService:GetProductInfo(game.placeId)

-- ✅ Load Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Impact Hub",
    Icon = 0,
    LoadingTitle = "Impact Hub",
    LoadingSubtitle = "by IMPACTlazy",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = false,
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false,
})

-- ✅ Tab: Main
local MainTab = Window:CreateTab("Main", 4483362458)
local MainSection = MainTab:CreateSection("About")

Rayfield:Notify({
    Title = "Impact Hub",
    Content = "Script Loaded! | "..infoXXX.Name,
    Duration = 5,
    Image = 4483362458,
})

MainTab:CreateParagraph({
    Title = "Developer",
    Content = "DEVELOPER: IMPACTlazy\nUPDATE: 17/03/2026\nTotal Execute: "..currentValue.."\nExecutor: "..identifyexecutor()
})

MainTab:CreateButton({
    Name = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/EvhJBNbgG7")
        Rayfield:Notify({Title="Copied!", Content="Discord link copied!", Duration=3})
    end,
})

local MainSection2 = MainTab:CreateSection("Server")

MainTab:CreateToggle({
    Name = "Auto Reconnect",
    CurrentValue = false,
    Flag = "AutoReconnect",
    Callback = function(state)
        local reconnecting = state
        if state then
            GuiService.ErrorMessageChanged:Connect(function(msg)
                if not reconnecting or msg == "" then return end
                task.wait(0.5)
                pcall(function()
                    if privateServerId and privateServerId ~= "" then
                        TeleportService:TeleportToPrivateServer(placeId, privateServerId, {LocalPlayer})
                    else
                        TeleportService:TeleportToPlaceInstance(placeId, jobId, LocalPlayer)
                    end
                end)
            end)
        end
    end,
})

MainTab:CreateToggle({
    Name = "Auto Buso (Armament Haki)",
    CurrentValue = false,
    Flag = "AutoBuso",
    Callback = function(state) _G.FGDXX = state end,
})

MainTab:CreateToggle({
    Name = "Auto Conqueror Haki",
    CurrentValue = false,
    Flag = "AutoConqueror",
    Callback = function(state) _G.FGDZZXC = state end,
})

MainTab:CreateToggle({
    Name = "Auto Observation Haki",
    CurrentValue = false,
    Flag = "AutoObservation",
    Callback = function(state) _G.FGDZZ = state end,
})

MainTab:CreateToggle({
    Name = "Speed Hack",
    CurrentValue = false,
    Flag = "SpeedHack",
    Callback = function(state) _G.FGDSS = state end,
})

MainTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJump",
    Callback = function(state) _G.infiJMP = state end,
})

-- ✅ Tab: Farm
local FarmTab = Window:CreateTab("Farm", 4483362458)
local FarmSection1 = FarmTab:CreateSection("Farm Level")

FarmTab:CreateToggle({
    Name = "Auto Farm Max Level",
    CurrentValue = false,
    Flag = "AutoFarmLevel",
    Callback = function(state) _G.StartingLevelingFARM = state end,
})

local FarmSection2 = FarmTab:CreateSection("Farm Mob")

local selectedNPCs = {}
FarmTab:CreateDropdown({
    Name = "Select NPC (เรียงตาม Level)",
    Options = getNPC(true),
    CurrentOption = {"None"},
    MultipleOptions = true,
    Flag = "SelectedNPC",
    Callback = function(value)
        selectedNPCs = {}
        if type(value) == "string" then table.insert(selectedNPCs, ResolveMobName(value))
        else for _, v in ipairs(value) do table.insert(selectedNPCs, ResolveMobName(v)) end end
    end,
})

FarmTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(state) _G.StartingAUfarm = state end,
})

FarmTab:CreateToggle({
    Name = "Auto Get Quest",
    CurrentValue = false,
    Flag = "AutoQuest",
    Callback = function(state) _G.StartQuest = state end,
})

local FarmSection3 = FarmTab:CreateSection("Farm Boss (World Spawn)")

local selectedBossNPCs = {}
FarmTab:CreateDropdown({
    Name = "Select Boss",
    Options = getBossNPC(),
    CurrentOption = {"None"},
    MultipleOptions = true,
    Flag = "SelectedBoss",
    Callback = function(value)
        if type(value) == "string" then selectedBossNPCs = {value}
        else selectedBossNPCs = value end
    end,
})

FarmTab:CreateToggle({
    Name = "Auto Farm Boss (World Spawn)",
    CurrentValue = false,
    Flag = "AutoFarmBoss",
    Callback = function(state) _G.StartingBossFarm = state end,
})

-- ✅ Tab: Boss
local BossTab = Window:CreateTab("Boss", 4483362458)
local BossSection1 = BossTab:CreateSection("Spawning Boss")

_G.ListSpawnBoss = {"GojoBoss","SukunaBoss","YujiBoss","JinwooBoss","AizenBoss","AlucardBoss","MadokaBoss","YamatoBoss"}
_G.SelectBosss = {"AizenBoss"}

BossTab:CreateDropdown({
    Name = "Select Target Boss",
    Options = _G.ListSpawnBoss,
    CurrentOption = {"AizenBoss"},
    MultipleOptions = true,
    Flag = "TargetBoss",
    Callback = function(value)
        if type(value) == "string" then _G.SelectBosss = {value} else _G.SelectBosss = value end
    end,
})

_G.ListSpawnBossPT = {"SaberBoss","IchigoBoss","QinShiBoss"}
_G.SelectBSpity = "SaberBoss"
_G.RealNamedBRoX = "SaberBoss"

BossTab:CreateDropdown({
    Name = "Select Boss For Pity",
    Options = _G.ListSpawnBossPT,
    CurrentOption = {"SaberBoss"},
    MultipleOptions = false,
    Flag = "PityBoss",
    Callback = function(value)
        _G.RealNamedBRoX = value
        _G.SelectBSpity = {value}
    end,
})

BossTab:CreateToggle({
    Name = "Auto Farm Selected Boss",
    CurrentValue = false,
    Flag = "FarmSelectBS",
    Callback = function(state) _G.FarmSelectBS = state end,
})

BossTab:CreateToggle({
    Name = "Auto Farm With Pity",
    CurrentValue = false,
    Flag = "FarmWithPity",
    Callback = function(state) _G.FarmWithptBS = state end,
})

BossTab:CreateToggle({
    Name = "Auto Farm All Spawning Boss",
    CurrentValue = false,
    Flag = "FarmAllBS",
    Callback = function(state) _G.FarmAllBS = state end,
})

local BossSection2 = BossTab:CreateSection("Summon Boss")

_G.ListSpawnBossPTX = {"SaberBoss","IchigoBoss","QinShiBoss","GilgameshBoss","YamatoBoss","RimuruBoss","StrongestofTodayBoss","StrongestinHistoryBoss","AnosBoss","BlessedMaidenBoss","TrueAizenBoss","SaberAlterBoss"}
_G.SelectBSpityX = {"SaberBoss"}
_G.RealNamedBRoSS = "SaberBoss"
_G.modeSelcX = "Normal"

BossTab:CreateDropdown({
    Name = "Select Mode",
    Options = {"Normal","Medium","Hard","Extreme"},
    CurrentOption = {"Normal"},
    MultipleOptions = false,
    Flag = "BossMode",
    Callback = function(value) _G.modeSelcX = value end,
})

BossTab:CreateDropdown({
    Name = "Select Summon Boss",
    Options = _G.ListSpawnBossPTX,
    CurrentOption = {"SaberBoss"},
    MultipleOptions = false,
    Flag = "SummonBoss",
    Callback = function(value)
        _G.RealNamedBRoSS = value
        _G.SelectBSpityX = {value}
    end,
})

BossTab:CreateToggle({
    Name = "Auto Farm Summon Boss",
    CurrentValue = false,
    Flag = "FarmSummon",
    Callback = function(state) _G.FarmSUMMON = state end,
})

BossTab:CreateToggle({
    Name = "Auto Farm Summon With Pity",
    CurrentValue = false,
    Flag = "FarmSummonPity",
    Callback = function(state) _G.FarmSUMMONpity = state end,
})

local BossSection3 = BossTab:CreateSection("Material Farm")

BossTab:CreateToggle({
    Name = "Auto Farm Limitless Key",
    CurrentValue = false,
    Flag = "FarmLK",
    Callback = function(state) _G.FarmlK = state end,
})

BossTab:CreateToggle({
    Name = "Auto Farm Malevolent Key",
    CurrentValue = false,
    Flag = "FarmMK",
    Callback = function(state) _G.FarmMK = state end,
})

BossTab:CreateToggle({
    Name = "Auto Farm Broken Sword",
    CurrentValue = false,
    Flag = "FarmGilga",
    Callback = function(state) _G.FarmGILGA = state end,
})

BossTab:CreateToggle({
    Name = "Auto Craft Divine Grail",
    CurrentValue = false,
    Flag = "AutoCraftDG",
    Callback = function(state) _G.AutoCraftDG = state end,
})

-- ✅ Tab: Setting
local SettingTab = Window:CreateTab("Setting", 4483362458)
local SettingSection1 = SettingTab:CreateSection("Weapon & Method")

SettingTab:CreateDropdown({
    Name = "Select Weapon",
    Options = getAllWeapons(),
    CurrentOption = {"None"},
    MultipleOptions = false,
    Flag = "SelectedWeapon",
    Callback = function(value) selectedWeapon = value end,
})

SettingTab:CreateToggle({
    Name = "Auto Equip Weapon",
    CurrentValue = false,
    Flag = "AutoEquip",
    Callback = function(state) _G.EquiD = state end,
})

SettingTab:CreateDropdown({
    Name = "Attack Method",
    Options = {"Above","Behind","Below"},
    CurrentOption = {"Above"},
    MultipleOptions = false,
    Flag = "AttackMethod",
    Callback = function(value) _G.ModeAT = value end,
})

SettingTab:CreateSlider({
    Name = "Distance Farm",
    Range = {1, 25},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 11,
    Flag = "DistanceFarm",
    Callback = function(value) _G.Adis = value end,
})

SettingTab:CreateSlider({
    Name = "Teleport Cooldown",
    Range = {1, 10},
    Increment = 1,
    Suffix = "s",
    CurrentValue = 1,
    Flag = "TPCooldown",
    Callback = function(value) TELEPORT_COOLDOWN = value end,
})

SettingTab:CreateSlider({
    Name = "TP Delay (Anti-267)",
    Range = {1, 100},
    Increment = 1,
    Suffix = "x0.01s",
    CurrentValue = 15,
    Flag = "TPDelay",
    Callback = function(value) _G.TPDelay = value / 100 end,
})

SettingTab:CreateSlider({
    Name = "TP Steps (Anti-267)",
    Range = {1, 5},
    Increment = 1,
    Suffix = "steps",
    CurrentValue = 2,
    Flag = "TPSteps",
    Callback = function(value) _G.TPSteps = value end,
})

SettingTab:CreateToggle({
    Name = "Step TP Mode",
    CurrentValue = true,
    Flag = "StepTPMode",
    Callback = function(state) _G.TPStepMode = state end,
})

SettingTab:CreateToggle({
    Name = "No Clip",
    CurrentValue = true,
    Flag = "NoClip",
    Callback = function(value) SetNoclip(value) end,
})

SettingTab:CreateToggle({
    Name = "Boost FPS",
    CurrentValue = false,
    Flag = "BoostFPS",
    Callback = function(value) if value then BoostFps() end end,
})

SettingTab:CreateToggle({
    Name = "Auto Ascend",
    CurrentValue = false,
    Flag = "AutoAscend",
    Callback = function(value)
        _G.Ascend = value
        if value then
            task.spawn(function()
                while _G.Ascend do
                    pcall(function() ReplicatedStorage.RemoteEvents.RequestAscend:FireServer() end)
                    task.wait(10)
                end
            end)
        end
    end,
})

SettingTab:CreateButton({
    Name = "Redeem All Codes",
    Callback = function()
        local CodesModule = require(ReplicatedStorage:WaitForChild("CodesConfig"))
        local Remote = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("CodeRedeem")
        for codeName, _ in pairs(CodesModule.Codes) do
            task.spawn(function()
                pcall(function()
                    if CodesModule.IsValid(codeName) then Remote:InvokeServer(codeName) end
                end)
            end)
            task.wait(0.3)
        end
        Rayfield:Notify({Title="Done!", Content="Redeemed all codes!", Duration=3})
    end,
})

local SettingSection2 = SettingTab:CreateSection("Skill Ability")

SettingTab:CreateToggle({Name="Auto Use Skill",CurrentValue=false,Flag="AutoSkill",Callback=function(state) _G.AutoSkill=state end})
SettingTab:CreateToggle({Name="Auto Skill Z",CurrentValue=false,Flag="SkillZ",Callback=function(state) _G.SkillZ=state end})
SettingTab:CreateToggle({Name="Auto Skill X",CurrentValue=false,Flag="SkillX",Callback=function(state) _G.SkillX=state end})
SettingTab:CreateToggle({Name="Auto Skill C",CurrentValue=false,Flag="SkillC",Callback=function(state) _G.SkillC=state end})
SettingTab:CreateToggle({Name="Auto Skill V",CurrentValue=false,Flag="SkillV",Callback=function(state) _G.SkillV=state end})
SettingTab:CreateToggle({Name="Auto Skill F",CurrentValue=false,Flag="SkillF",Callback=function(state) _G.SkillF=state end})

-- ✅ Tab: Threshold
local ThrTab = Window:CreateTab("Threshold", 4483362458)
local ThrSection = ThrTab:CreateSection("Build Swap")

ThrTab:CreateDropdown({
    Name = "Damage Build",
    Options = {"1","2","3","4","5"},
    CurrentOption = {"2"},
    MultipleOptions = false,
    Flag = "DamageBuild",
    Callback = function(value) _G.DamageBuild = tonumber(value) end,
})

ThrTab:CreateDropdown({
    Name = "Luck Build",
    Options = {"1","2","3","4","5"},
    CurrentOption = {"1"},
    MultipleOptions = false,
    Flag = "LuckBuild",
    Callback = function(value) _G.LuckBuild = tonumber(value) end,
})

ThrTab:CreateSlider({
    Name = "HP Threshold %",
    Range = {1, 50},
    Increment = 1,
    Suffix = "%",
    CurrentValue = 15,
    Flag = "HPThreshold",
    Callback = function(value) _G.BuildThreshold = value end,
})

ThrTab:CreateToggle({
    Name = "Auto Build Swap",
    CurrentValue = false,
    Flag = "AutoBuildSwap",
    Callback = function(state) _G.AutoBuildSwitch = state end,
})

-- ✅ Tab: Stats
local StatsTab = Window:CreateTab("Stats", 4483362458)
local StatsSection = StatsTab:CreateSection("Auto Stats")

StatsTab:CreateToggle({Name="Auto Stats Melee",CurrentValue=false,Flag="StatsMelee",Callback=function(state) _G.AutoStatsMelee=state end})
StatsTab:CreateToggle({Name="Auto Stats Defense",CurrentValue=false,Flag="StatsDefense",Callback=function(state) _G.AutoStatsDefense=state end})
StatsTab:CreateToggle({Name="Auto Stats Sword",CurrentValue=false,Flag="StatsSword",Callback=function(state) _G.AutoStatsSword=state end})
StatsTab:CreateToggle({Name="Auto Stats Power",CurrentValue=false,Flag="StatsPower",Callback=function(state) _G.AutoStatsPower=state end})

-- ✅ Tab: Misc
local MiscTab = Window:CreateTab("Misc", 4483362458)
local MiscSection1 = MiscTab:CreateSection("Merchant")

local Pey = {"All"}
for _, itemName in ipairs(GetAllMerchantItems()) do table.insert(Pey, itemName) end

MiscTab:CreateDropdown({
    Name = "Select Merchant Items",
    Options = Pey,
    CurrentOption = {"All"},
    MultipleOptions = true,
    Flag = "MerchantItems",
    Callback = function(values) _G.selectedMerchantItems = values end,
})

MiscTab:CreateToggle({
    Name = "Auto Buy Merchant",
    CurrentValue = false,
    Flag = "AutoBuyMerchant",
    Callback = function(state) _G.AutoBuyMerchant = state end,
})

local MiscSection2 = MiscTab:CreateSection("Reroll")

MiscTab:CreateDropdown({
    Name = "Select Target Trait",
    Options = GetAllTraitsFormatted(),
    CurrentOption = {},
    MultipleOptions = true,
    Flag = "TargetTrait",
    Callback = function(values)
        _G.selectedTrait = {}
        local v = NormalizeToTable(values)
        for _, formatted in pairs(v) do
            local realName = DropdownMap[formatted]
            if realName then table.insert(_G.selectedTrait, realName) end
        end
    end,
})

MiscTab:CreateToggle({
    Name = "Auto Reroll Trait",
    CurrentValue = false,
    Flag = "AutoRerollTrait",
    Callback = function(state) _G.StartGachaTRAIT = state end,
})

MiscTab:CreateDropdown({
    Name = "Select Target Race",
    Options = GetAllRacesFormatted(),
    CurrentOption = {},
    MultipleOptions = true,
    Flag = "TargetRace",
    Callback = function(values)
        _G.selectedRaces = {}
        for _, formatted in pairs(NormalizeToTable(values)) do
            local realName = _G.RaceDropdownMap[formatted]
            if realName then table.insert(_G.selectedRaces, realName) end
        end
    end,
})

MiscTab:CreateToggle({
    Name = "Auto Reroll Race",
    CurrentValue = false,
    Flag = "AutoRerollRace",
    Callback = function(state) _G.AutoRerollRace = state if state then AutoRerollRace() end end,
})

MiscTab:CreateDropdown({
    Name = "Select Target Clan",
    Options = GetAllClansFormatted(),
    CurrentOption = {},
    MultipleOptions = true,
    Flag = "TargetClan",
    Callback = function(values)
        _G.selectedClans = {}
        for _, formatted in pairs(NormalizeToTable(values)) do
            local realName = _G.ClanDropdownMap[formatted]
            if realName then table.insert(_G.selectedClans, realName) end
        end
    end,
})

MiscTab:CreateToggle({
    Name = "Auto Reroll Clan",
    CurrentValue = false,
    Flag = "AutoRerollClan",
    Callback = function(state) _G.AutoRerollClan = state if state then AutoRerollClan() end end,
})

-- ✅ Tab: Trading
local TradeTab = Window:CreateTab("Trading", 4483362458)
local TradeSection = TradeTab:CreateSection("Trade")

_G.SelectedTrade = TradeNames[1]
local TRADE_MULTIPLIER = 1

TradeTab:CreateDropdown({
    Name = "Select Trade",
    Options = TradeNames,
    CurrentOption = {TradeNames[1]},
    MultipleOptions = false,
    Flag = "SelectedTrade",
    Callback = function(value) _G.SelectedTrade = value end,
})

TradeTab:CreateSlider({
    Name = "Trade Multiplier",
    Range = {1, 10},
    Increment = 1,
    Suffix = "x",
    CurrentValue = 1,
    Flag = "TradeMultiplier",
    Callback = function(value) TRADE_MULTIPLIER = value end,
})

TradeTab:CreateButton({
    Name = "Add Trade Items",
    Callback = function()
        if not _G.SelectedTrade then return end
        local selected = type(_G.SelectedTrade) == "table" and _G.SelectedTrade[1] or _G.SelectedTrade
        local tradeItems = ListTrade[selected]
        if not tradeItems then return end
        local TradeEvent = ReplicatedStorage.Remotes.TradeRemotes.AddItemToTrade
        for _, item in ipairs(tradeItems) do
            pcall(function()
                TradeEvent:FireServer("Items", item.Name, item.Amount * TRADE_MULTIPLIER)
                task.wait(0.5)
            end)
        end
        Rayfield:Notify({Title="Done!", Content="Added trade items!", Duration=3})
    end,
})

-- ✅ Tab: Dungeon
local DungeonTab = Window:CreateTab("Dungeon", 4483362458)
local DungeonSection1 = DungeonTab:CreateSection("Dungeon Lobby")

DungeonTab:CreateDropdown({
    Name = "Select Dungeon",
    Options = {"CidDungeon","RuneDungeon","DoubleDungeon","BossRush"},
    CurrentOption = {"CidDungeon"},
    MultipleOptions = false,
    Flag = "SelectedDungeon",
    Callback = function(value) _G.SelectedDungeon = value end,
})

DungeonTab:CreateButton({
    Name = "Open Dungeon Portal",
    Callback = function()
        ReplicatedStorage.Remotes.RequestDungeonPortal:FireServer(_G.SelectedDungeon)
    end,
})

local DungeonSection2 = DungeonTab:CreateSection("Dungeon Feature")

DungeonTab:CreateDropdown({
    Name = "Select Mode",
    Options = {"Easy","Medium","Hard","Extreme"},
    CurrentOption = {"Easy"},
    MultipleOptions = false,
    Flag = "DungeonMode",
    Callback = function(value) _G.SelectMODEraid = value end,
})

DungeonTab:CreateToggle({Name="Auto Replay",CurrentValue=false,Flag="AutoReplay",Callback=function(state) _G.ReplayRAID=state end})
DungeonTab:CreateToggle({Name="Auto Start",CurrentValue=false,Flag="AutoStart",Callback=function(state) _G.StartRAID=state end})
DungeonTab:CreateToggle({Name="Auto Farm Dungeon",CurrentValue=false,Flag="AutoFarmDungeon",Callback=function(state) _G.FarmRAID=state end})

-- ✅ Tab: Teleport
local TPTab = Window:CreateTab("Teleport", 4483362458)
local TPSection = TPTab:CreateSection("Teleport")

TPTab:CreateDropdown({
    Name = "Select Island",
    Options = GetIslandOptions(),
    CurrentOption = {"None"},
    MultipleOptions = false,
    Flag = "SelectedIsland",
    Callback = function(value) _G.SelectedIslandTP = value end,
})

TPTab:CreateDropdown({
    Name = "Select NPC",
    Options = GetNPCOptions(),
    CurrentOption = {"None"},
    MultipleOptions = false,
    Flag = "SelectedNPCTP",
    Callback = function(value) _G.SelectedNPC = value end,
})

TPTab:CreateToggle({Name="Teleport to Island",CurrentValue=false,Flag="TpIsland",Callback=function(state) _G.TpIslandX=state end})
TPTab:CreateToggle({Name="Teleport to NPC",CurrentValue=false,Flag="TpNPC",Callback=function(state) _G.TpNpcX=state end})

-- ✅ Tab: Webhook
local WebhookTab = Window:CreateTab("Webhook", 4483362458)
local WebhookSection = WebhookTab:CreateSection("Webhook")

_G.WebhookLink = "None"
_G.WebhookDelay = "60"

WebhookTab:CreateInput({
    Name = "Webhook Link",
    PlaceholderText = "https://discord.com/api/webhooks/...",
    RemoveTextAfterFocusLost = false,
    Flag = "WebhookLink",
    Callback = function(text) _G.WebhookLink = text end,
})

WebhookTab:CreateInput({
    Name = "Webhook Delay (seconds)",
    PlaceholderText = "60",
    RemoveTextAfterFocusLost = false,
    Flag = "WebhookDelay",
    Callback = function(text)
        if tonumber(text) and tonumber(text) > 0 then _G.WebhookDelay = text end
    end,
})

WebhookTab:CreateToggle({
    Name = "Auto Send Webhook",
    CurrentValue = false,
    Flag = "AutoWebhook",
    Callback = function(state) _G.WebhookStart = state end,
})

-- ============================================================
-- ✅ ALL LOOPS
-- ============================================================

-- ✅ Anti-Fall: ตรวจสอบทุก 0.1 วินาที ป้องกันตกแมพ
local SAFE_Y = 150 -- ความสูงที่วาปกลับมา
local FALL_Y = 5   -- ถ้า Y ต่ำกว่านี้ถือว่าตก

task.spawn(function()
    while true do
        local char = LP.Character
        if char then
            local hrpX = char:FindFirstChild("HumanoidRootPart")
            if hrpX then
                local y = hrpX.Position.Y
                -- ถ้าตกต่ำกว่า FALL_Y หรือลงเร็วผิดปกติ
                if y < FALL_Y then
                    hrpX.AssemblyLinearVelocity = Vector3.zero
                    hrpX.CFrame = CFrame.new(hrpX.Position.X, SAFE_Y, hrpX.Position.Z)
                end
            end
        end
        task.wait(0.1)
    end
end)

-- ✅ ล็อค Y ไม่ให้ตกขณะ farm (Heartbeat)
RunService.Heartbeat:Connect(function()
    if not (_G.StartingLevelingFARM or _G.StartingAUfarm or _G.StartingBossFarm or _G.FarmSelectBS or _G.FarmSUMMON) then return end
    local char = LP.Character
    if not char then return end
    local hrpX = char:FindFirstChild("HumanoidRootPart")
    if hrpX and hrpX.Position.Y < FALL_Y then
        hrpX.AssemblyLinearVelocity = Vector3.zero
        hrpX.CFrame = CFrame.new(hrpX.Position.X, SAFE_Y, hrpX.Position.Z)
    end
end)

-- Auto Buso
spawn(function()
    while task.wait(0.5) do
        if _G.FGDXX and not IsBusoActive() then
            ReplicatedStorage.RemoteEvents.HakiRemote:FireServer("Toggle")
        end
    end
end)

-- Auto Conqueror
spawn(function()
    while task.wait(1) do
        if _G.FGDZZXC then ReplicatedStorage.RemoteEvents.ConquerorHakiRemote:FireServer() end
    end
end)

-- Auto Observation
spawn(function()
    while task.wait(0.5) do
        if _G.FGDZZ then
            if player.PlayerGui.DodgeCounterUI.MainFrame.Visible == false then
                ReplicatedStorage.RemoteEvents.ObservationHakiRemote:FireServer("Toggle")
            end
        end
    end
end)

-- Speed Hack
task.spawn(function()
    while task.wait(0.3) do
        if _G.FGDSS then
            local char = player.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum and hum.WalkSpeed ~= 160 then hum.WalkSpeed = 160 end
            end
        end
    end
end)

-- Infinite Jump
local UIS = game:GetService("UserInputService")
if not UIS.TouchEnabled then
    UIS.JumpRequest:Connect(function()
        if _G.infiJMP then
            local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end)
end

-- Auto Equip Weapon
task.spawn(function()
    while task.wait(0.5) do
        if _G.EquiD and selectedWeapon then equipWeapon(selectedWeapon) end
    end
end)

-- Auto Stats
task.spawn(function()
    while task.wait(0.1) do
        if StatPoints.Value > 0 then
            if _G.AutoStatsMelee then Event:FireServer("Melee", 1) end
            if _G.AutoStatsDefense then Event:FireServer("Defense", 1) end
            if _G.AutoStatsSword then Event:FireServer("Sword", 1) end
            if _G.AutoStatsPower then Event:FireServer("Power", 1) end
        end
    end
end)

-- Auto Farm Mob
task.spawn(function()
    while task.wait() do
        if _G.PrioriySystem or _G.PrioriySystem2 then task.wait() continue end
        if _G.StartingAUfarm then
            for _, name in ipairs(selectedNPCs) do
                if not _G.StartingAUfarm then break end
                while true do
                    local found = false
                    for _, target in ipairs(workspace:GetDescendants()) do
                        if not _G.StartingAUfarm then break end
                        if _G.PrioriySystem or _G.PrioriySystem2 then break end
                        if target:IsA("Model") and target:FindFirstChild("Humanoid") and target.Humanoid.Health > 0 then
                            local clean = target.Name:gsub("%d+",""):match("^%s*(.-)%s*$")
                            if target.Name:lower():find("boss") then continue end
                            if clean == name then
                                found = true
                                if _G.StartQuest then GetQuest(clean) end
                                local npcPos = target.WorldPivot.Position
                                local islandName, islandData = GetClosestIsland(npcPos)
                                if not target:FindFirstChild("HumanoidRootPart") then
                                    if islandData and (hrp.Position - islandData.Position).Magnitude > 780 then TeleportToIsland(islandName) end
                                    task.wait(TELEPORT_COOLDOWN)
                                    TP(CFrame.new(npcPos))
                                else
                                    repeat
                                        local cok = target:WaitForChild("HumanoidRootPart",2)
                                        if cok then TP(cok.CFrame * getAttackPos()) task.wait() CombatRemote:FireServer(cok.Position) AktifSkill() end
                                    until not _G.StartingAUfarm or _G.PrioriySystem or _G.PrioriySystem2 or not target:FindFirstChild("Humanoid") or target.Humanoid.Health <= 0
                                end
                            end
                        end
                    end
                    if not found then break end
                    task.wait()
                end
            end
        end
    end
end)

-- ✅ Auto Farm Level (ฉลาดขึ้น)
local currentFarmingMob = "None"
local lastLevel = 0

task.spawn(function()
    while true do
        task.wait(0.1)
        if _G.PrioriySystem or _G.PrioriySystem2 then continue end
        if not _G.StartingLevelingFARM then continue end

        -- เช็ค level ว่าเปลี่ยนไหม ถ้าเปลี่ยนให้หา quest ใหม่
        local currentLevel = player.Data.Level.Value
        if currentLevel ~= lastLevel then
            lastLevel = currentLevel
            isProcessing = false -- reset เพื่อให้รับ quest ใหม่ได้
        end

        local _, npcType = GetBestQuest()
        if not npcType then continue end

        -- แปลงชื่อ mob พิเศษ
        local npcTypeX = npcType
        if npcType == "SlimeWarrior" then npcTypeX = "Slime" end

        currentFarmingMob = npcTypeX

        -- หา mob ในแมพ
        local target = findNPC(npcTypeX, "IncludeUnderscore")

        -- ถ้าไม่เจอ mob ในแมพ ให้ TP ไป island ที่น่าจะมี mob
        if not target then
            -- หา island จาก QuestConfig
            local bestIsland = nil
            for islandName, data in pairs(IslandPositions) do
                if string.lower(islandName):find(string.lower(npcTypeX):sub(1,4)) then
                    bestIsland = islandName
                    break
                end
            end
            if bestIsland then TeleportToIsland(bestIsland) end
            task.wait(2)
            continue
        end

        if target.Humanoid.Health <= 0 then continue end

        -- TP และโจมตี
        local npcPos = target.WorldPivot.Position
        local islandName, islandData = GetClosestIsland(npcPos)

        -- TP ไป island ถ้าอยู่ไกลเกิน
        if islandData and (hrp and (hrp.Position - islandData.Position).Magnitude > 780) then
            TeleportToIsland(islandName)
            task.wait(1)
        end

        if not target:FindFirstChild("HumanoidRootPart") then
            task.wait(TELEPORT_COOLDOWN)
            TP(CFrame.new(npcPos))
        else
            repeat
                if _G.PrioriySystem or _G.PrioriySystem2 or not _G.StartingLevelingFARM then break end
                local cok = target:FindFirstChild("HumanoidRootPart")
                if cok then
                    TP(cok.CFrame * getAttackPos())
                    task.wait()
                    CombatRemote:FireServer(cok.Position)
                    AktifSkill()
                end

                -- เช็คว่า level เปลี่ยนไหม ถ้าเปลี่ยนให้ออกจาก loop เพื่อหา mob ใหม่
                if player.Data.Level.Value ~= lastLevel then break end

            until not _G.StartingLevelingFARM
                or _G.PrioriySystem
                or _G.PrioriySystem2
                or not target:FindFirstChild("Humanoid")
                or target.Humanoid.Health <= 0
        end
    end
end)

-- Boss Farm Loop (World Spawn)
task.spawn(function()
    while task.wait() do
        if _G.StartingBossFarm and #selectedBossNPCs > 0 then
            _G.PrioriySystem = true
            for _, bossName in ipairs(selectedBossNPCs) do
                if not _G.StartingBossFarm then break end
                local target = findNPC(bossName, "IncludeUnderscore")
                if target and target:FindFirstChild("Humanoid") and target.Humanoid.Health > 0 then
                    local npcPos = target.WorldPivot.Position
                    local islandName, islandData = GetClosestIsland(npcPos)
                    if not target:FindFirstChild("HumanoidRootPart") then
                        if islandData and (hrp.Position - islandData.Position).Magnitude > 780 then TeleportToIsland(islandName) end
                        task.wait(0.5)
                        TP(CFrame.new(npcPos))
                    else
                        repeat
                            local cok = target:WaitForChild("HumanoidRootPart",2)
                            if cok then CheckBuildByHP(target) TP(cok.CFrame * getAttackPos()) task.wait() CombatRemote:FireServer(cok.Position) AktifSkill() end
                        until not _G.StartingBossFarm or not target:FindFirstChild("Humanoid") or target.Humanoid.Health <= 0
                    end
                end
            end
        else
            if not _G.FarmSelectBS and not _G.FarmWithptBS and not _G.FarmAllBS then _G.PrioriySystem = false end
            task.wait(0.5)
        end
    end
end)

-- Farm Selected Boss
local function IsAnyBossAlive(target)
    for _, bossName in ipairs(target) do
        local npc = findNPC(bossName, "IncludeUnderscore")
        if npc and npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 then return true end
    end
    return false
end

local bossIndex = 1
task.spawn(function()
    while task.wait() do
        if _G.FarmSelectBS and _G.SelectBosss then
            for _, name in ipairs(_G.SelectBosss) do
                local target = findNPC(name, "IncludeUnderscore")
                if target and target:FindFirstChild("Humanoid") and target.Humanoid.Health > 0 then
                    _G.PrioriySystem = true
                    local npcPos = target.WorldPivot.Position
                    local _, islandData = GetClosestIsland(npcPos)
                    if not target:FindFirstChild("HumanoidRootPart") then
                        if islandData and (hrp.Position - islandData.Position).Magnitude > 780 then TeleportToIsland(_) end
                        task.wait(TELEPORT_COOLDOWN) TP(CFrame.new(npcPos))
                    else
                        repeat
                            local cok = target:WaitForChild("HumanoidRootPart",2)
                            if cok then CheckBuildByHP(target) TP(cok.CFrame * getAttackPos()) task.wait() CombatRemote:FireServer(cok.Position) AktifSkill() end
                        until not _G.FarmSelectBS or not target:FindFirstChild("Humanoid") or target.Humanoid.Health <= 0
                    end
                else
                    if not IsAnyBossAlive(_G.SelectBosss) then _G.PrioriySystem = false end
                end
            end
        elseif _G.FarmAllBS then
            if bossIndex > #_G.ListSpawnBoss then bossIndex = 1 end
            local name = _G.ListSpawnBoss[bossIndex]
            local target = findNPC(name, "IncludeUnderscore")
            if target and target:FindFirstChild("Humanoid") and target.Humanoid.Health > 0 then
                _G.PrioriySystem = true
                local hrpBoss = target:FindFirstChild("HumanoidRootPart")
                if hrpBoss then
                    repeat CheckBuildByHP(target) TP(hrpBoss.CFrame * getAttackPos()) CombatRemote:FireServer(hrpBoss.Position) AktifSkill() task.wait()
                    until not _G.FarmAllBS or not target:FindFirstChild("Humanoid") or target.Humanoid.Health <= 0
                end
            else
                bossIndex += 1
                if not IsAnyBossAlive(_G.ListSpawnBoss) then _G.PrioriySystem = false end
            end
            task.wait(0.2)
        else
            _G.PrioriySystem = false
        end
    end
end)

-- Summon Boss Loop
task.spawn(function()
    while task.wait() do
        if _G.PrioriySystem then task.wait() continue end
        if _G.FarmSUMMON and _G.SelectBSpityX then
            for _, name in ipairs(_G.SelectBSpityX) do
                local target = findNPC(name, "IncludeUnderscore")
                if target and target:FindFirstChild("Humanoid") and target.Humanoid.Health > 0 then
                    _G.PrioriySystem2 = true
                    local npcPos = target.WorldPivot.Position
                    local islandName, islandData = GetClosestIsland(npcPos)
                    if not target:FindFirstChild("HumanoidRootPart") then
                        if islandData and (hrp.Position - islandData.Position).Magnitude > 780 then TeleportToIsland(islandName) end
                        task.wait(TELEPORT_COOLDOWN) TP(CFrame.new(npcPos))
                    else
                        repeat
                            local cok = target:WaitForChild("HumanoidRootPart",2)
                            if cok then CheckBuildByHP(target) TP(cok.CFrame * getAttackPos()) task.wait() CombatRemote:FireServer(cok.Position) AktifSkill() end
                        until not _G.FarmSUMMON or _G.PrioriySystem or not target:FindFirstChild("Humanoid") or target.Humanoid.Health <= 0
                    end
                else
                    local Rep = ReplicatedStorage
                    local pes = _G.RealNamedBRoSS
                    if pes == "StrongestofTodayBoss" or pes == "StrongestinHistoryBoss" then
                        local evt = Rep.Remotes.RequestSpawnStrongestBoss
                        evt:FireServer(pes == "StrongestofTodayBoss" and "StrongestToday" or "StrongestHistory", _G.modeSelcX)
                    elseif pes == "GilgameshBoss" or pes == "BlessedMaidenBoss" or pes == "SaberAlterBoss" then
                        Rep.Remotes.RequestSummonBoss:FireServer(pes, _G.modeSelcX)
                    elseif pes == "AnosBoss" then Rep.Remotes.RequestSpawnAnosBoss:FireServer("Anos", _G.modeSelcX)
                    elseif pes == "RimuruBoss" then Rep.RemoteEvents.RequestSpawnRimuru:FireServer(_G.modeSelcX)
                    elseif pes == "TrueAizenBoss" then Rep.RemoteEvents.RequestSpawnTrueAizen:FireServer(_G.modeSelcX)
                    else Rep.Remotes.RequestSummonBoss:FireServer(pes) end
                    wait(1)
                    if not IsAnyBossAlive(_G.ListSpawnBoss) then _G.PrioriySystem2 = false end
                end
            end
        end
    end
end)

-- Auto Craft Divine Grail
task.spawn(function()
    while wait(2) do
        if _G.AutoCraftDG then
            ReplicatedStorage.Remotes.RequestGrailCraft:InvokeServer("DivineGrail", 1)
        end
    end
end)

-- Auto Buy Merchant
task.spawn(function()
    while task.wait() do
        if _G.AutoBuyMerchant then CheckAndBuy() end
    end
end)

-- Auto Reroll Trait
task.spawn(function()
    while task.wait() do
        if _G.StartGachaTRAIT then CheckTrait() end
    end
end)

-- Dungeon Loops
task.spawn(function()
    while task.wait(2) do
        if _G.StartRAID then
            pcall(function()
                if player.PlayerGui.DungeonUI.ContentFrame.Actions.EasyDifficultyFrame.Visible then
                    ReplicatedStorage.Remotes.DungeonWaveVote:FireServer(_G.SelectMODEraid)
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(2) do
        if _G.ReplayRAID then
            pcall(function()
                if player.PlayerGui.DungeonUI.ReplayDungeonFrameVisibleOnlyWhenClearingDungeon.Visible then
                    ReplicatedStorage.Remotes.DungeonWaveReplayVote:FireServer("sponsor")
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.7) do
        if _G.FarmRAID then
            for _, name in ipairs(getNPC(true)) do
                local target = findNPC(name, "IncludeUnderscore")
                if target and target:FindFirstChild("Humanoid") and target.Humanoid.Health > 0 then
                    if not target:FindFirstChild("HumanoidRootPart") then
                        TP(CFrame.new(target.WorldPivot.Position))
                    else
                        repeat
                            local cok = target:WaitForChild("HumanoidRootPart",2)
                            if cok then CheckBuildByHP(target) TP(cok.CFrame * getAttackPos()) CombatRemote:FireServer(cok.Position) end
                            AktifSkill() task.wait()
                        until not _G.FarmRAID or not target:FindFirstChild("Humanoid") or target.Humanoid.Health <= 0
                    end
                end
            end
        end
    end
end)

-- Teleport Loops
task.spawn(function()
    while task.wait(1) do
        if _G.TpIslandX then
            pcall(function() ReplicatedStorage.Remotes:WaitForChild("TeleportToPortal"):FireServer(_G.SelectedIslandTP) end)
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if _G.TpNpcX then
            local npcFolder = workspace:FindFirstChild("ServiceNPCs")
            if npcFolder then
                local npcModel = npcFolder:FindFirstChild(_G.SelectedNPC)
                if npcModel then TP(npcModel:GetPivot()) end
            end
        end
    end
end)

-- Webhook Loop
task.spawn(function()
    while wait(_G.WebhookDelay) do
        if _G.WebhookStart and _G.WebhookLink and _G.WebhookLink ~= "None" then
            manualTrigger(_G.WebhookLink)
        end
    end
end)

-- Safety Mode
task.spawn(function()
    while true do
        SafetyMode()
        task.wait()
    end
end)
