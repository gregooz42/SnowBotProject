local spell =  {}

function spell.deferlement()

	local id = 13126
	local level = 1
	local pa = 4
	local po = 5
	local element = "eau"

	iaPrint.spell("deferlement()")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.epee_divine()

	local id = 13110
	local level = 3
	local pa = 3

	iaPrint.spell("epee_divine()")
	iaCastManager.self(id, level, pa)
end

function spell.intimidation()

	local id = 13108
	local level = 10
	local pa = 2
	local po = 2
	local element = "eau"

	iaPrint.spell("intimidation()")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.ferveur()

	local id = 14676
	local level = 30
	local pa = 3
	local po = 4
	local element = "eau"

	iaPrint.spell("ferveur()")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.puissance()

	local id = 13118
	local level = 55
	local pa = 3

	iaPrint.spell("puissance()")
	iaCastManager.self(id, level, pa)
end

return spell
