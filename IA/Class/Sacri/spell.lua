local spell =  {}

function spell.hemoragie()

	local id = 12748
	local element = "air"
	local level = 1
	local pa = 3

	iaPrint.spell("hemoragie()")
	iaCastManager.distEnemy(id, level, pa, 1, element)
end


function spell.attirance()

	local id = 12735
	local level = 1
	local pa = 3
	local po = 3
	if fightCharacter:getLifePointsP() == 100 then
		po = 3
	elseif fightCharacter:getLifePointsP() >= 80 then
		po = 4
	elseif fightCharacter:getLifePointsP() >= 60 then
		po = 5
	elseif fightCharacter:getLifePointsP() >= 40 then
		po = 6
	elseif fightCharacter:getLifePointsP() >= 20 then
		po = 7
	else
		po = 8
	end

	iaCastManager.distEnemy(id, level, pa, po, "air")
end

function spell.mutilation()

	local id = 12737
	local level = 10
	local pa = 2

	iaPrint.spell("mutilation")
	iaCastManager.self(id, level, pa)
end

function spell.epee_vorace()

	local id = 12744
	local level = 15
	local pa = 3
	local po = 3

	iaPrint.spell("epee_vorace()")
	iaCastManager.invoc(id, level, pa, po)
end

function spell.assault()

	local id = 12733
	local element = "air"
	local level = 25
	local pa = 2
	local po = 2

	iaPrint.spell("assault()")
	iaCastManager.distEnemy(id, level, pa, po, element)
end

function spell.furie()

	local id = 12723
	local element = "air"
	local level = 70
	local pa = 3

	iaPrint.spell("furie()")
	iaCastManager.distEnemy(id, level, pa, 1, element)
end

return spell
