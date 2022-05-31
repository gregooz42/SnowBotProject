local spell =  {}

function spell.fleche_magique()

	local id = 13047
	local element = "air"
	local level = 1
	local pa = 3
	local po = 8

	iaPrint.spell("fleche_magique")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.fleche_de_recul()

	local id = 13055
	local element = "air"
	local level = 1
	local pa = 3
	local po = 8

	iaPrint.spell("fleche_de_recul")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.tir_eloigne()

	local id = 13058
	local level = 10
	local pa = 3

	iaPrint.spell("tir_eloigne")
	iaCastManager.self(id, level, pa)
end

function spell.tir_critique()

	local id = 13048
	local level = 25
	local pa = 2

	iaPrint.spell("tir_critique")
	iaCastManager.self(id, level, pa)
end

function spell.tir_puissant()

	local id = 13052
	local level = 40
	local pa = 3

	iaPrint.spell("tir_puissant")
	iaCastManager.self(id, level, pa)
end

function spell.fleche_harcelante()

	local id = 13059
	local element = "air"
	local level = 45
	local pa = 3
	local po = 5

	iaPrint.spell("fleche_harcelante")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.absorbante()

	local id = 13064
	local element = "air"
	local level = 65
	local pa = 4
	local po = 8

	iaPrint.spell("absorbante")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.maitrise_arc()

	local id = 13066
	local level = 90
	local pa = 2

	iaPrint.spell("maitrise_arc")
	iaCastManager.self(id, level, pa)
end

return spell
