local spell =  {}

function spell.rempart()

	local id = 12981
	local level = 1
	local pa = 2

	iaPrint.spell("rempart()")
	iaCastManager.self(id, level, pa)
end

function spell.attaque_naturelle()

	local id = 12978
	local element = "feu"
	local level = 1
	local pa = 3
	local po = 6

	iaPrint.spell("attaque_naturelle()")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.lethargie()

	local id = 12993
	local element = "feu"
	local level = 20
	local pa = 4
	local po = 3

	iaPrint.spell("lethargie()")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.bastion()

	local id = 12995
	local level = 30
	local pa = 2

	iaPrint.spell("bastion()")
	iaCastManager.self(id, level, pa)
end

function spell.mise_en_garde()

	local id = 12997
	local level = 75
	local pa = 2

	iaPrint.spell("mise_en_garde()")
	iaCastManager.self(id, level, pa)
end

function spell.glyphe_enflamme()

	local id = 12985
	local element = "feu"
	local level = 85
	local pa = 3
	local po = 4

	iaPrint.spell("glyphe_enflamme()")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.bouclier_feca()

	local id = 12982
	local level = 90
	local pa = 2

	iaPrint.spell("bouclier_feca()")
	iaCastManager.self(id, level, pa)
end

return spell
