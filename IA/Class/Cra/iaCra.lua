local iaCra =  {}

spell = dofile("scripts\\IA\\Class\\Cra\\spell.lua")

function iaCra.main()

	local po_max = 8

	spell.tir_critique()
	spell.tir_puissant()
	spell.maitrise_arc()
	if fightAction:getDistance(fightCharacter:getCellId(), fightAction:getNearestEnemy()) > po_max then
		spell.tir_eloigne()
	end
	spell.absorbante()
	spell.absorbante()
	spell.fleche_de_recul()
	spell.fleche_magique()
	spell.fleche_magique()
	spell.fleche_harcelante()
	spell.fleche_harcelante()
	if fightAction:getDistance(fightCharacter:getCellId(), fightAction:getNearestEnemy()) > po_max - 3 then
		spell.tir_eloigne()
	end

	if fightAction:getDistance(fightCharacter:getCellId(), fightAction:getNearestEnemy()) > po_max then
		iaMove.cac()
	else
		iaMove.dist(fightCharacter:getMP())
	end
end

return iaCra
