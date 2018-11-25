-- This file is loaded from "DungeonGuide.toc"
local hbd = LibStub("HereBeDragons-2.0")

local function SetTomTomCoords(zone, x, y)
	DEFAULT_CHAT_FRAME.editBox:SetText("/way " .. zone .. x .. " " .. y)
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end	

local function DungeonGuideCommands(msg, editbox)

  if msg == "deadmines" then
	  print("DG activating " .. msg)
	  SetTomTomCoords("Deadmines", 10,10); 
	  
  elseif msg == "wailingcaverns" then
	print("DG activating " .. msg)
	SetTomTomCoords("Wailing Caverns", 15,15);
  
  elseif msg == "test" then
	-- local facing = GetPlayerFacing()
	-- GetPlayerFacing does not work in instances
	
	local dungeonID = 1;
	local name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday, bonusRepAmount, minPlayers, isTimeWalker, name2, minGearLevel = GetLFGDungeonInfo(dungeonID)
		
	print("name: " .. name .. ", name2: " .. name2 .. ", typeID: " .. typeID)

	else
	print("Syntax: /dg instance");
	end
end

SLASH_DG1, SLASH_DG2 = '/dg', '/dungeonguide';

SlashCmdList["DG"] = DungeonGuideCommands