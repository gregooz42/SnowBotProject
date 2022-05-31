local iaEnu =  {}

spell = dofile("scripts\\IA\\Class\\Enu\\spell.lua")

function iaEnu.main()

	local po_max = 10

	if fightAction:getDistance(fightCharacter:getCellId(), fightAction:getNearestEnemy()) > po_max then
		spell.acceleration()
	end

	spell.cupidite()
	--spell.sac_anime(2)
	spell.pelle_des_anciens()
	spell.pelle_aurifiere()
	spell.lancer_de_piece()
	spell.lancer_de_piece()
	spell.lancer_de_piece()

	if fightAction:getDistance(fightCharacter:getCellId(), fightAction:getNearestEnemy()) > po_max then
		iaMove.cac()
	else
		iaMove.dist(fightCharacter:getMP())
	end
end

return iaEnu
