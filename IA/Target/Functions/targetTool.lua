local targetTool = {}

function targetTool.getEnemyEntities()
	iaPrint.debug("targetTool.lua", "getEnemyEntities()")

	local entities = fightAction:getAllEntities()
	local enemyEntities = {}

	for _, ent in ipairs(entities) do
		if ent.Team then
			table.insert(enemyEntities, ent)
		end
	end
	return enemyEntities
end

function targetTool.resP(spellElement, entitie)
	iaPrint.debugM("targetTool.lua", "resP()")

	if spellElement == "terre" then
		return entitie.PercentTerre
	elseif spellElement == "air" then
		return entitie.PercentAir
	elseif spellElement == "feu" then
		return entitie.PercentFeu
	elseif spellElement == "eau" then
		return entitie.PercentEau
	elseif spellElement == "neutre" then
		return entitie.PercentNeutre
	else
		iaPrint.error("Vous n'avez pas rentrer d'élément. enemy.lua -> resP()")
	end
end

return targetTool
