local iaPanda =  {}

spell = dofile("scripts\\IA\\Class\\Panda\\spell.lua")

function iaPanda.main()

	local po_max = 4

	spell.colere_de_zaotoishwan()
	spell.ribote()
	spell.ribote()
	spell.ribote()
	spell.eviction()
	spell.eviction()
	spell.eviction()

	if fightAction:getDistance(fightCharacter:getCellId(), fightAction:getNearestEnemy()) > po_max then
		iaMove.cac()
	else
		iaMove.dist(fightCharacter:getMP())
	end
end

return iaPanda
