local toolF = {}

-- local hour = 5 / local planning = {0, 1, 2, .. 22, 23}
function toolF.isOnPlanning(hour, planning)
	printF.debug("toolF.lua", "isOnPlanning()")

	for _, h in ipairs(planning) do
		if math.floor(hour) == h then
			return true
		end
	end
	return false
end

-- local mapCord = 55542322 / local map = "5,16"
function toolF.isOnMap(mapCord)
	printF.debug("toolF.lua", "isOnMap(" .. tostring(mapCord) .. ")")

	if map:currentMap() == mapCord
	or tostring(map:currentMapId()) == tostring(mapCord)
	then
		return true
	end
	return false
end

-- local mapList = { "55542322", "5,-16", 36154254, etc..}
function toolF.isOnMapList(mapList)
	printF.debug("toolF.lua", "isOnMapList()")

	for _, list in ipairs(mapList) do
		if map:currentMap() == list
		or tostring(map:currentMapId()) == tostring(list)
		then
			return true
		end
	end
	return false
end

-- local mapPath = { { map = "55542322", path = "right" }, etc.. }
function toolF.isOnMapPath(mapPath)
	printF.debug("toolF.lua", "isOnMapPath()")

	for _, mapInfo in ipairs(mapPath) do
		if map:currentMap() == mapInfo.map
		or tostring(map:currentMapId()) == mapInfo.map
		then
			return true
		end
	end
	return false
end

function toolF.useBar(slot) -- 1 à 10
	printF.debug("toolF.lua", "useBar()")

	local message = developer:createMessage("PresetUseRequestMessage")
	message.presetId = tonumber(slot)
	developer:sendMessage(message)
end

function toolF.privateStatus(bool)
	printF.debug("toolF.lua", "privateStatus(" .. tostring(bool) .. ")")

	local PlayerStatus = developer:createMessage("PlayerStatus")
	local monMessage = developer:createMessage("PlayerStatusUpdateeRequestMessage")

	if bool == true then
		printF.info("J'active le status privé.")
		PlayerStatus.statusId = 30
	else
		printF.info("Je désactive le status privé.")
		PlayerStatus.statusId = 10
	end
	monMessage.status = PlayerStatus
	developer:sendMessage(monMessage)
end

function toolF.regen(lifeP)
	printF.debug("toolF.lua", "regen(" .. lifeP .. ")")

	while character:lifePointsP() < lifeP do
		  delayF.wait(1)
	end
end

return toolF
