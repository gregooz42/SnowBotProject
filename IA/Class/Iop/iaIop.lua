local iaIop =  {}

spell = dofile("scripts\\IA\\Class\\Iop\\spell.lua")

function iaIop.main()

	local po_max = 6

	if fightAction:getCurrentTurn() == 1
	then
		spell.epee_divine()
	else
		spell.puissance()
	end

	spell.deferlement()
	spell.ferveur()
	spell.ferveur()
	spell.ferveur()
	spell.intimidation()
	spell.deferlement()
	spell.intimidation()
	iaMove.cac()
end

return iaIop
