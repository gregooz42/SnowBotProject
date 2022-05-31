local spell =  {}

function spell.ribote()

	local id = 12786
	local element = "terre"
	local level = 1
	local pa = 3
	local po = 3

	iaPrint.spell("ribote()")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.bombance()
	iaPrint.spell("bombance()")

	local id = 12804
	local level = 1
	local pa = 1

	iaCastManager.self(id, level, pa)
end

function spell.eviction()
	iaPrint.spell("eviction()")

	local id = 12790
	local element = "terre"
	local level = 40
	local pa = 2
	local po = 1

	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.colere_de_zaotoishwan()
	iaPrint.spell("colere_de_zaotoishwan()")

	local id = 12795
	local level = 65
	local pa = 3

	iaCastManager.self(id, level, pa)
end

return spell
