local spell =  {}

function spell.mot_alternatif()
	iaPrint.spell("mot_alternatif()")
	local id = 13171
	local element = "feu"
	local level = 1
	local pa = 3
	local po = 4 + fightCharacter:getMP()

	local ally = iaAlly.lowLife(po)

	if ally ~= nil then
		if ally == fightCharacter:getCellId()
		then
			iaCastManager.distEnemy(id, level, pa, po, element)
		else
			iaCastManager.distAlly(id, level, pa, po, ally)
		end
	else
		iaCastManager.distEnemy(id, level, pa, po, element)
	end
end

function spell.mot_d_amitier()
	iaPrint.spell("mot_d_amitier()")
	local id = 13176
	local level = 1
	local pa = 3
	local po = 2


	iaCastManager.invoc(id, level, pa, po)
end


function spell.stimulant()
	iaPrint.spell("stimulant()")

	local id = 13173
	local level = 10
	local pa = 2
	local po = 2

	local ally = fightAction:getNearestAlly()
	local character = fightCharacter:getCellId()

	if fightAction:getDistance(character, ally) > po + fightCharacter:getMP() then
		iaCastManager.self(id, level, pa)
	else
		iaCastManager.distAlly(id, level, pa, po, ally)
	end
end

function spell.tir_critique()

	local id = 13048
	local level = 25
	local pa = 2

	iaPrint.spell("tir_critique()")
	iaCastManager.self(id, level, pa)
end

function spell.mot_selectif()
	iaPrint.spell("mot_selectif()")
	local id = 13177
	local element = "feu"
	local level = 25
	local pa = 3
	local po = 6

	local ally = iaAlly.lowLife(po)
	if ally ~= nil then
		if ally == fightCharacter:getCellId()
		then
			iaCastManager.self(id, level, pa)
		else
			iaCastManager.distAlly(id, level, pa, po, ally)
		end
	else
		iaCastManager.distEnemy(id, level, pa, po, element)
	end
end

return spell
