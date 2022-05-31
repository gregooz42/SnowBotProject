local iaAlly = {}

function iaAlly.lowLife(distance)
	iaPrint.debug("iaAlly.lua", "lowLife()")

	local entities = fightAction:getAllEntities()
	local cellCharacter = fightCharacter:getCellId()
	local allyEntities = {}
	local cellChoice = nil
	local lifeP_limit = 90

	for _, ent in ipairs(entities) do
		if not ent.Stats.summoned
		and not ent.Team
		then
			table.insert(allyEntities, ent)
		end
	end
	for _, thisAlly in ipairs(allyEntities) do

		local lifeP = 100 - (((thisAlly.MaxLifePoints - thisAlly.LifePoints) / thisAlly.MaxLifePoints) * 100)

		if fightAction:getDistance(cellCharacter, thisAlly.CellId) < (distance + fightCharacter:getMP())
		and lifeP < lifeP_limit
		then
			lifeP_limit = lifeP
			cellChoice = thisAlly.CellId
		end
	end
	iaPrint.info(tostring(cellChoice))
	return cellChoice
end

return iaAlly
