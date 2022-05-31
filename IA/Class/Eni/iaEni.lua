local iaEni =  {}

spell = dofile("scripts\\IA\\Class\\Eni\\spell.lua")

function iaEni.main()

	local po_max = 4

	if fightAction:getCurrentTurn() == 1 then
		--spell.mot_d_amitier()
	end
	spell.mot_selectif()
	spell.mot_selectif()
	spell.mot_alternatif()
	spell.mot_alternatif()

	spell.stimulant()

	if fightAction:getDistance(fightCharacter:getCellId(), fightAction:getNearestEnemy()) > po_max then
		iaMove.cac()
	else
		iaMove.dist(fightCharacter:getMP())
	end
end

return iaEni
