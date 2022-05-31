local spell =  {}

function spell.arbre(po)

	local id = 13519
	local level = 1
	local pa = 2

	iaPrint.spell("arbre()")
	iaCastManager.invoc(id, level, pa, po)
end

function spell.folle()

	local id = 13564
	local level = 1
	local pa = 4
	local po = 3

	iaPrint.spell("folle()")
	iaCastManager.invoc(id, level, pa, po)
end

function spell.ronce()

	local id = 13516
	local element = "terre"
	local level = 1
	local pa = 3
	local po = 6

	iaPrint.spell("ronce()")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.bloqueuse()

	local id = 13561
	local level = 6
	local pa = 4
	local po = 3

	iaPrint.spell("bloqueuse()")
	iaCastManager.invoc(id, level, pa, po)
end

function spell.sacrifiee()

	local id = 13567
	local level = 30
	local pa = 4
	local po = 3

	iaPrint.spell("sacrifiee()")
	iaCastManager.invoc(id, level, pa, po)
end

function spell.ronces_multiples()

	local id = 13524
	local element = "terre"
	local level = 45
	local pa = 3
	local po = 5

	iaPrint.spell("ronces_multiples()")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.gonflable(po)

	local id = 13573
	local level = 60
	local pa = 4
	if po == nil then
		po = 3
	end
	iaPrint.spell("gonflable()")
	iaCastManager.invoc(id, level, pa, po)
end

function spell.ronce_agressives()

	local id = 13527
	local element = "terre"
	local level = 65
	local pa = 4
	local po = 6

	iaPrint.spell("ronce_agressives()")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

return spell
