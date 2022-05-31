local prefightManager =  {}


function getCellPrefightCac(challengersCells, defendersCells)
	iaPrint.debug("prefightManager.lua", "getCellPrefightCac()")

	local cellPrefight = -1
	local tempDist = 999

	for allyCellId, allyEntityId in pairs(challengersCells) do
		if allyEntityId == -1 then -- si == -1 la case est dispo
			for enemyCellId, _ in pairs(defendersCells) do
				if not fightAction:isFreeCell(enemyCellId) then

					local thisDist = fightAction:getDistance(allyCellId, enemyCellId)

					if thisDist < tempDist then
						cellPrefight = allyCellId
						tempDist = thisDist
					end
				end
			end
		end
	end
	return cellPrefight
end

function prefightManager.main(challengersCells, defendersCells)
	iaPrint.debug("prefightManager.lua", "main()")

	local cellId = -1

	cellId = getCellPrefightCac(challengersCells, defendersCells)

	if cellId ~= -1 then
		fightAction:chooseCell(cellId)
	else
		iaPrint.error("Nous avons pas trouvé de cellule de placement.")
	end
end

return prefightManager
