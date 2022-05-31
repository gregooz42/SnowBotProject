local iaFeca =  {}

spell = dofile("scripts\\IA\\Class\\Feca\\spell.lua")

function iaFeca.main()

	local po_max = 4

	spell.rempart()
	spell.bouclier_feca()
	spell.mise_en_garde()
	spell.glyphe_enflamme()
	spell.bastion()
	spell.lethargie()
	spell.attaque_naturelle()
	spell.attaque_naturelle()

	if fightAction:getDistance(fightCharacter:getCellId(), fightAction:getNearestEnemy()) > po_max then
		iaMove.cac()
	else
		iaMove.dist(fightCharacter:getMP())
	end
end

return iaFeca
