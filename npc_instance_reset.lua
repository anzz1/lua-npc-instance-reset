------------------------------------------------------------------------------------------------
-- INSTANCE RESET NPC
------------------------------------------------------------------------------------------------

local EnableModule = true
local AnnounceModule = true   -- Announce module on player login ?
local UnitEntry = 300000      -- NPC ID

------------------------------------------------------------------------------------------------
-- END CONFIG
------------------------------------------------------------------------------------------------

if (not EnableModule) then return end
local FILE_NAME = string.match(debug.getinfo(1,'S').source, "[^/\\]*.lua$")

local function OnGossipHello(event, player, unit) 
	player:GossipMenuAddItem(0, "I would like to remove my instance saves.", 1, 1, false, "Are you sure you want to reset all instances?")
    player:GossipSendMenu(1, unit)
    unit:PerformEmote(1)
    return true
end    

local function OnGossipSelect(event, player, unit, sender, intid, code)
    if (intid == 1) then
    	player:UnbindAllInstances()
    	unit:SendUnitWhisper("Your instances have been reset.", 0, player)
        player:GossipComplete()
        unit:PerformEmote(23)
    end
    return true
end

local function moduleAnnounce(event, player)
	player:SendBroadcastMessage("This server is running the |cff4CFF00InstanceResetNPC|r module.")
end

RegisterCreatureGossipEvent(UnitEntry, 1, OnGossipHello)
RegisterCreatureGossipEvent(UnitEntry, 2, OnGossipSelect)
if (AnnounceModule) then
	RegisterPlayerEvent(3, moduleAnnounce)   -- PLAYER_EVENT_ON_LOGIN
end

PrintInfo("["..FILE_NAME.."] InstanceResetNPC module loaded. NPC ID: "..UnitEntry)
