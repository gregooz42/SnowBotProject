local iaEnemy = {}

-- local target = {move = cellId, enemy = enemyEntitie}
function createTarget(enemy, reacheablesCells, spellId)
	iaPrint.debug("iaEnemy.lua", "createTarget()")

	local cellCharacter = fightCharacter:getCellId()

	if fightAction:canCastSpellOnCell(cellCharacter, spellId, enemy.CellId) == 0 then
		return {
			move = -1,
			enemy = enemy
		}
	else
		local thisMove = nil
		local tempDist = 100
		for _, cellId in ipairs(reacheablesCells) do
			if fightAction:getDistance(cellCharacter, cellId) < tempDist
			and fightAction:canCastSpellOnCell(cellId, spellId, enemy.CellId) == 0
			then
				tempDist = fightAction:getDistance(cellCharacter, cellId)
				thisMove = cellId
			end
		end
		if thisMove ~= nil then
			return {
				move = thisMove,
				enemy = enemy
			}
		else
			return nil
		end
	end
end

-- local targetList = {{move = cellId, enemy = enemyEntitie}, etc.. }
function createTargetList(spellId)
	iaPrint.debug("iaEnemy.lua", "createTargetList()")

	local reacheablesCells = fightAction:getReachableCells()
	local targetList = {}
	local enemyEntities = targetTool.getEnemyEntities()
	local count = 0

	for _, enemy in ipairs(enemyEntities) do
		local target = createTarget(enemy, reacheablesCells, spellId)
		if target ~= nil then
			table.insert(targetList, target)
			count = count + 1
		end
	end
	if count == 0 then
		return nil
	else
		return targetList
	end
end

function percentLife(LifePoints, MaxLifePoints)
	local percent = 100 - math.floor((MaxLifePoints - LifePoints) / MaxLifePoints * 100)

	iaPrint.debugM("iaEnemy.lua", "percentLife() " .. percent)
	return percent
end

function iaEnemy.getTarget(spellId, spellElement)
	iaPrint.debug("iaEnemy.lua", "getTarget()")

	local targetList = createTargetList(spellId)
	if targetList == nil then
		return nil
	else
		local target = nil
		for _, thisTarget in ipairs(targetList) do
			local thisEnemy = thisTarget.enemy
			if not thisEnemy.Stats.summoned
			and (thisEnemy.Stats.invisibilityState == 0 or thisEnemy.Stats.invisibilityState == 3) -- 0 : visible / 1 : invisible / 2 : invisible / 3 : visible
			then
				if target == nil then
					target = thisTarget
				else
					local enemyThisTarget = thisTarget.enemy
					local enemyTarget = target.enemy

					if targetTool.resP(spellElement, enemyThisTarget) + percentLife(enemyThisTarget.LifePoints, enemyThisTarget.MaxLifePoints)
					< targetTool.resP(spellElement, enemyTarget) + percentLife(enemyTarget.LifePoints, enemyTarget.MaxLifePoints)
					then
						target = thisTarget
					end
				end
			end
		end
		if target == nil then
			return nil
		else
			return target
		end
	end
end



return iaEnemy
