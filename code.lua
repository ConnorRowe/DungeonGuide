-- This file is loaded from "DungeonGuide.toc"
local frame = CreateFrame("FRAME", "DGFrame", UIParent)
frame:RegisterEvent("BOSS_KILL")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("GOSSIP_SHOW")

curInstanceName = ""
--Whether to display certain elements
showFlag = false
--To keep track of the array index
local dtIndex

local sizeX = 574; local sizeY = 156

-- Set frame as drag-able.
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

-- Frame rendering stuff
frame:SetPoint("CENTER")
frame:SetSize(sizeX, sizeY)
local tex = frame:CreateTexture("ARTWORK")
tex:SetTexture("Interface/QUESTFRAME/TalkingHeads.BLP", CLAMPTOBLACKADDITIVE, CLAMPTOBLACKADDITIVE, LINEAR)
tex:SetTexCoord(0, 0.560546875, 0.4609375, 0.61328125)
tex:SetBlendMode("BLEND")
tex:SetAllPoints()

--Text stuff
local HTMLFrame = CreateFrame("SimpleHTML", "HTMLFrame", frame)
local text = ""
HTMLFrame:SetPoint("CENTER")
HTMLFrame:SetSize(sizeX*0.85, sizeY*0.7)
HTMLFrame:SetText(text)
HTMLFrame:SetFont('Fonts\\FRIZQT__.TTF', 12);
HTMLFrame:SetFontObject('h1', "GameFontNormal");
HTMLFrame:SetTextColor(0.1,0.1,0.1,1.0)

local function UpdateFrameDisplay(bool)
	if bool then
		HTMLFrame:SetTextColor(0.1,0.1,0.1,1.0)
		tex:SetTexture("Interface/QUESTFRAME/TalkingHeads.BLP", CLAMPTOBLACKADDITIVE, CLAMPTOBLACKADDITIVE, LINEAR)
		frame:SetMovable(true)
		frame:EnableMouse(true)
	else
		HTMLFrame:SetTextColor(0.1,0.1,0.1,1.0)
		tex:SetColorTexture(0.0,0.0,0.0,0.0)
		frame:SetMovable(false)
		frame:EnableMouse(false)
	end
end

local function EHBossKill(self, event, id, name, ...)
	if event == "BOSS_KILL" then
		print("DG: " .. name.. "(" .. id .. ")" .. " killed, proceeding to next step.")
		if id == 592 then
			dtIndex = 9
			IncrementDispTxt()
		end
		IncrementDispTxt()
	elseif event == "PLAYER_ENTERING_WORLD" then
		--Checking if the player is in an instance or not.
		dtIndex = 1;
		if IsInInstance() then
			local name, instanceType, difficultyID, difficultyName, maxPlayers, dynamicDifficulty, isDynamic, instanceMapID, instanceGroupSize, lfgDungeonsID = GetInstanceInfo()
			curInstanceName = name;
			if name == "Wailing Caverns" then showFlag = true ; end
			UpdateFrameDisplay(showFlag)
		else
			showFlag = false
			UpdateFrameDisplay(showFlag)
		end
		
		IncrementDispTxt()

	elseif event == "GOSSIP_SHOW" then
		local title1, gossip1 = GetGossipOptions()
		if title1 == "Let the event begin!" then
			dtIndex = 9
			IncrementDispTxt()
		end
	end
end
frame:SetScript("OnEvent", EHBossKill)

--Display Text Array
local dispTxt_WC = {"Proceed downwards through the cave, killing raptors along the way.<br />After the skeletons, turn left and walk towards the two night elves then kill |cffa335ee Lady Anacondra.",
					"Now, walk forwards up to the path bridging the two sides of the cavern.<br />Turn left and jump down from the bridge into the water below, and follow the cave to |cffa335ee Lord Pythas.",
					"Carry on walking through the cavern until you get to |cffa335ee Lord Cobrahn.",
					"Now Cobrahn is dead, jump off his platform into the cave below. Then walk east, towards the water until you find the turtle|cffa335ee Kresh.|cff191919 Kill him.",
					"Carry on walking, following the water while bearing right. Kill the giant thunder lizard named|cffa335ee Skum.",
					"After killing the giant lizard, follow the cave forwards for a while. Stop when you see a waterfall, as you must make sure you do not fall through the gap. Assess the gap and jump across it, then carry on walking through the cave until you reach |cffa335eeLord Serpentis.|cff191919 Kill him.",
					"Now, turn north-west and kill|cffa335ee Verdan the Everliving.",
					"Now jump down the hole that the giant monster was hiding, and walk back through the water. When you see the ramp up to land, follow it. Then, walk past the skeletons and follow the cave until you find|cffa335ee Muyoh.|cff191919 One player must talk to |cffa335eeMuyoh|cff191919 to start the escort event.<br/>After speaking to |cffa335eeMuyoh|cff191919, follow him and kill any enemies that attack!",
					"After speaking to |cffa335eeMuyoh|cff191919, follow him and kill any enemies that attack!",
					"Congratulations! You have defeated |cffa335eeMutanus the Devourer|cff191919 and saved the Wailing Caverns!"}

--Function to update text on the HTMLFrame element
function IncrementDispTxt()
	local newText
	if showFlag then newText = "<html><body><h1>|cff0070dd Wailing Caverns</h1><p><br />" .. dispTxt_WC[dtIndex] .. "</p></body></html>" 
	else newText = ""
	end
	HTMLFrame:SetText(newText)
	dtIndex = dtIndex + 1
end	

local function SetTomTomCoords(zone, x, y)
	DEFAULT_CHAT_FRAME.editBox:SetText("/way " .. zone .. x .. " " .. y)
	ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
end	

local function DungeonGuideCommands(msg, editbox)

	if msg == "skip" then
		IncrementDispTxt()
  
	elseif msg == "test" then

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
		
	--local dungeonID = 1
	--local name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday, bonusRepAmount, minPlayers, isTimeWalker, name2, minGearLevel = GetLFGDungeonInfo(dungeonID)
		
	--print("name: " .. name .. ", name2: " .. name2 .. ", typeID: " .. typeID)
	
	else
	print("Syntax: /dg [skip/test]")
	end
end

SLASH_DG1, SLASH_DG2 = '/dg', '/dungeonguide';

SlashCmdList["DG"] = DungeonGuideCommands