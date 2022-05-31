local iaMove = {}


function iaMove.cac()
	iaPrint.debug("iaMove.lua", "cac()")

	local cellEnemy = fightAction:getNearestEnemy()
	fightAction:moveToWardCell(cellEnemy)
end

function iaMove.ally(cell)
	iaPrint.debug("iaMove.lua", "ally()")

	if cell ~= fightCharacter:getCellId()
	then
		if cell then
			fightAction:moveToWardCell(cell)
		end
	end
end

function iaMove.line(cell, po)
	iaPrint.debug("iaMove.lua", "line()")

	local character = fightCharacter:getCellId()
	local cellsReachable = fightAction:getReachableCells()
	local tempDist = 999
	local myCell = -1


	for _, thisCell in ipairs(cellsReachable) do
		if fightAction:inLineOfSight(thisCell, cell)
		and fightAction:getDistance(thisCell, character) < tempDist
		and fightAction:getDistance(thisCell, character) <= po
		then
			myCell = thisCell
			tempDist = fightAction:getDistance(thisCell, character)
		end
	end
	if myCell > -1 then
		fightAction:moveToWardCell(myCell)
	end
end

function iaMove.dist(pm)
	iaPrint.debug("iaMove.lua", "dist()")

	local cellEnemy = fightAction:getNearestEnemy()
	local cellCharacter = fightCharacter:getCellId()
	local distance = fightAction:getDistance(cellCharacter, cellEnemy)
	local cellsReachable = fightAction:getReachableCells()
	local myCell = nil

	if cellsReachable == nil or fightCharacter:getMP() < 1 then
		return nil
	end

	for _, thisCell in ipairs(cellsReachable) do
		if fightAction:isWalkable(thisCell) then
			if fightAction:getDistance(thisCell, cellEnemy) > distance
			and ( pm ~= nil and fightAction:getDistance(thisCell, cellCharacter) == pm)
			then
				myCell = thisCell
				distance = fightAction:getDistance(thisCell, cellEnemy)
			end
		end
	end

	if myCell ~= nil then
		fightAction:moveToWardCell(myCell)
	end
end

return iaMove
