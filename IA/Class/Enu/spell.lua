local spell =  {}

function spell.sac_anime(po)

	local id = 13328
	local level = 1
	local pa = 2

	iaPrint.spell("sac_anime()")
	iaCastManager.invoc(id, level, pa, po)
end

function spell.lancer_de_piece()

	local id = 13338
	local element = "eau"
	local level = 1
	local pa = 2
	local po = 8

	iaPrint.spell("lancer_de_piece()")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.acceleration()

	local id = 13342
	local level = 10
	local pa = 2

	iaPrint.spell("acceleration()")
	iaCastManager.self(id, level, pa)
end

function spell.pelle_aurifiere()

	local id = 13343
	local element = "eau"
	local level = 30
	local pa = 4
	local po = 7

	iaPrint.spell("pelle_aurifiere()")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.cupidite()

	local id = 13339
	local level = 40
	local pa = 2

	iaPrint.spell("cupidite()")
	iaCastManager.self(id, level, pa)
end

function spell.pelle_des_anciens()

	local id = 0
	local element = "eau"
	local level = 70
	local pa = 5
	local po = 7

	iaPrint.spell("pelle_des_anciens()")
	--iaCastManager.distEnemy(id, level, pa, po, element)
	iaPrint.spell("RENTREZ L'IDENTIFIANT()")
end

return spell
