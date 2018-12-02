-- This file is loaded from "DungeonGuide.toc"
local hbd = LibStub("HereBeDragons-2.0")
local frame = CreateFrame("FRAME", "DGFrame", UIParent)
frame:RegisterEvent("BOSS_KILL")
local function EHBossKill(self, event, id, name, ...)
 print(event .. ": " .. id .. ", " .. name)
end
frame:SetScript("OnEvent", EHBossKill)

-- Set frame as drag-able.
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

-- Frame rendering stuff
frame:SetPoint("CENTER")
frame:SetSize(574, 156)
local tex = frame:CreateTexture("ARTWORK")
tex:SetTexture("Interface/QUESTFRAME/TalkingHeads.BLP", CLAMPTOBLACKADDITIVE, CLAMPTOBLACKADDITIVE, LINEAR)
tex:SetTexCoord(0, 0.560546875, 0.4609375, 0.61328125)
tex:SetBlendMode("BLEND")
tex:SetAllPoints()

local function SetTomTomCoords(zone, x, y)
	DEFAULT_CHAT_FRAME.editBox:SetText("/way " .. zone .. x .. " " .. y)
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end	

local function DungeonGuideCommands(msg, editbox)

  if msg == "deadmines" then
	  print("DG activating " .. msg)
	  SetTomTomCoords("Deadmines", 10,10)
	  
  elseif msg == "wailingcaverns" then
	print("DG activating " .. msg)
	SetTomTomCoords("Wailing Caverns", 15,15)
  
  elseif msg == "test" then
	-- local facing = GetPlayerFacing()
	-- GetPlayerFacing does not work in instances
	
	if GetZoneText() == "The Wailing Caverns" then
		print "Player is in correct zone"
		end
		
	-- Bosses and their encounter IDs
	local anacondra = GetLFGDungeonEncounterInfo(1,1)
	local cobrahn = GetLFGDungeonEncounterInfo(1,2)
	local kresh = GetLFGDungeonEncounterInfo(1,3)
	local pythas = GetLFGDungeonEncounterInfo(1,4)
	local skum = GetLFGDungeonEncounterInfo(1,5)
	local serpentis = GetLFGDungeonEncounterInfo(1,6)
	local verden = GetLFGDungeonEncounterInfo(1,7)
	local mutanus = GetLFGDungeonEncounterInfo(1,8)
	local serpentis = GetLFGDungeonEncounterInfo(1,6)
		
	local dungeonID = 1
	local name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday, bonusRepAmount, minPlayers, isTimeWalker, name2, minGearLevel = GetLFGDungeonInfo(dungeonID)
		
	print("name: " .. name .. ", name2: " .. name2 .. ", typeID: " .. typeID)

	else
	print("Syntax: /dg instance")
	end
end

SLASH_DG1, SLASH_DG2 = '/dg', '/dungeonguide';

SlashCmdList["DG"] = DungeonGuideCommands