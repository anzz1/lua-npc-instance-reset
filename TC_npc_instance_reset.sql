-- --------------------------------------------------------------------------------------
--	INSTANCE RESET NPC - 300000
-- --------------------------------------------------------------------------------------
SET
@Entry 		:= 300000,
@Model 		:= 24877,
@Name 		:= "Cromi",
@Title 		:= "Instance Reset",
@Icon 		:= "Speak",
@GossipMenu := 0,
@MinLevel 	:= 80,
@MaxLevel 	:= 80,
@Faction 	:= 35,
@NPCFlag 	:= 1,
@Scale		:= 1.0,
@Rank		:= 0,
@Type 		:= 7,
@TypeFlags 	:= 134217728,
@FlagsExtra := 2,
@AIName		:= "PassiveAI",
@Script 	:= "";

-- NPC
DELETE FROM world.creature_template WHERE entry = @Entry;
INSERT INTO world.creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, scale, rank, unit_class, unit_flags, unit_flags2, type, type_flags, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, @Scale, @Rank, 1, 768, 2048, @Type, @TypeFlags, @FlagsExtra, @AIName, @Script);
