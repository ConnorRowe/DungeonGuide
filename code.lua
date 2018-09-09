-- This file is loaded from "DungeonGuide.toc"

local function DungeonGuideCommands(msg, editbox)

  if msg == "deadmines" then
	  print("DG activating " .. msg)
	  DEFAULT_CHAT_FRAME.editBox:SetText("/way 10 10") ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0) 
	  
  elseif msg == "wailingcaverns" then
	print("DG activating " .. msg)
	
	else
	print("Syntax: /dg instance");
	end
end

SLASH_DG1, SLASH_DG2 = '/dg', '/dungeonguide';

SlashCmdList["DG"] = DungeonGuideCommands