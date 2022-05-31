local iaCastManager = {}



function iaCastManager.distEnemy(id, level, pa, po, element)
	iaPrint.debug("iaCastManager.lua", "distEnemy()")

	if fightCharacter:getAP() >= pa
	and fightCharacter:getLevel() >= level
	then
		local target = iaEnemy.getTarget(id, element)

		if target ~= nil then
			local enemy = target.enemy

			iaPrint.error("Target move -> " .. target.move)
			if target.move ~= -1 then
				local startCellId = fightCharacter:getCellId()
				fightAction:moveToWardCell(target.move)
				if startCellId == fightCharacter:getCellId() then
					iaPrint.error("Erreur dans le déplacement, je passe mon tour.")
					fightAction:passTurn()
				end
			end
			iaPrint.error("Target enemy -> " .. enemy.cellId)
			if fightAction:canCastSpellOnCell(fightCharacter:getCellId(), id, enemy.cellId) then
				fightAction:castSpellOnCell(id, enemy.cellId)
			else
				iaPrint.error("Bug impossible de lancé le sort ")
			end
		else
			iaPrint.error("Pas de cible on en cherche une nouvelle.")
			local nearestEnemy = fightAction:getNearestEnemy()
			if fightAction:canCastSpellOnCell(fightCharacter:getCellId(), id, nearestEnemy) then
				iaPrint.info("Cible trouvée mais on ne lance pas car bug invi.")
				--fightAction:castSpellOnCell(id, nearestEnemy)
			end
		end
	end
end

function iaCastManager.invoc(id, level, pa, po)
	iaPrint.debug("iaCastManager.lua", "invoc()")

	if fightCharacter:getAP() >= pa
	and fightCharacter:getLevel() >= level
	then

		local cellsCanCast = getCellsCanCast(id, po)
		local character = fightCharacter:getCellId()

		local myCellId = -1
		local tempDist = 0
		for _, thisCellId in ipairs(cellsCanCast) do
			if fightAction:getDistance(character, thisCellId) > tempDist then
				myCellId = thisCellId
				tempDist = fightAction:getDistance(character, thisCellId)
			end
		end
		if myCellId >= 0 then
			fightAction:castSpellOnCell(id, myCellId)
		end
	end
end

function iaCastManager.self(id, level, pa)
	iaPrint.debug("iaCastManager.lua", "self()")

	local character = fightCharacter:getCellId()

	if fightCharacter:getAP() >= pa
	and fightCharacter:getLevel() >= level
	then
		if(fightAction:canCastSpellOnCell(character, id, character) == 0) then
			fightAction:castSpellOnCell(id, character)
		end
	end
end

function iaCastManager.distAlly(id, level, pa, po, ally)
	iaPrint.debug("iaCastManager.lua", "distAlly()")

	local character = fightCharacter:getCellId()

	if fightCharacter:getAP() >= pa
	and fightCharacter:getLevel() >= level
	then
		if(fightAction:canCastSpellOnCell(character, id, ally) == 0) then
			fightAction:castSpellOnCell(id, ally)
		else
			fightAction:moveToWardCell(ally)
			character = fightCharacter:getCellId()
			if(fightAction:canCastSpellOnCell(character, id, ally) == 0) then
				fightAction:castSpellOnCell(id, ally)
			end
		end
	end
end

function iaCastManager.cacEnemy(id, level, pa, enemy)
	iaPrint.debug("iaCastManager.lua", "cacEnemy()")

	local character = fightCharacter:getCellId()

	if fightCharacter:getAP() >= pa
	and fightCharacter:getLevel() >= level
	then
		if(fightAction:canCastSpellOnCell(character, id, enemy) == 0) then
			fightAction:castSpellOnCell(id, enemy)
		else
			iaMove.cac()
			character = fightCharacter:getCellId()
			if(fightAction:canCastSpellOnCell(character, id, enemy) == 0) then
				fightAction:castSpellOnCell(id, enemy)
			end
		end
	end
end

function iaCastManager.distEnemyLine(id, level, pa, po, enemy)
	iaPrint.debug("iaCastManager.lua", "distEnemyLine()")

	local character = fightCharacter:getCellId()

	if fightCharacter:getAP() >= pa
	and fightCharacter:getLevel() >= level
	and fightAction:inLineOfSight(enemy, character)
	then
		if(fightAction:canCastSpellOnCell(character, id,enemy) == 0) then
			fightAction:castSpellOnCell(id, enemy)
		else
			fightAction:moveToWardCell(enemy)
			character = fightCharacter:getCellId()
			if(fightAction:canCastSpellOnCell(character, id, enemy) == 0) then
				fightAction:castSpellOnCell(id, enemy)
			end
		end
	end
end

function getCellsCanCast(spellId, spellPO)
	iaPrint.debug("iaCastManager.lua", "getCellsCanCast()")

	local character = fightCharacter:getCellId()
	local cellsCanCast = {}

	for cellId = 0, 559, 1 do -- toutes les cellules de la map
		if fightAction:getDistance(character, cellId) <= spellPO then
			if fightAction:canCastSpellOnCell(character, spellId, cellId) == 0 then
				table.insert(cellsCanCast, cellId)
			end
		end
	end
	return cellsCanCast
end

return iaCastManager
