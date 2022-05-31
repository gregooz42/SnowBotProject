local iaSadi =  {}

spell = dofile("scripts\\IA\\Class\\Sadi\\spell.lua")

function iaSadi.main()

	local po_max = 6 + fightCharacter:getRange()

	--spell.gonflable(1)
	if fightAction:getDistance(fightCharacter:getCellId(), fightAction:getNearestEnemy()) > 5 then
		--spell.sacrifiee()
	end
	--spell.folle()
	--spell.ronces_multiples()
	--spell.ronce_agressives()
	spell.ronce()
	spell.ronce()
	--spell.arbre(2)
	if fightAction:getDistance(fightCharacter:getCellId(), fightAction:getNearestEnemy()) > po_max then
		iaMove.cac()
	else
		iaMove.dist(fightCharacter:getMP())
	end
end

return iaSadi
