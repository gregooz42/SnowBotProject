local iaSacri =  {}

spell = dofile("scripts\\IA\\Class\\Sacri\\spell.lua")

SACRI_MUTILATION = false

function spell_mutilation()

	if SACRI_MUTILATION == false
	and fightCharacter:getLifePointsP() >= 50
	then
		spell.mutilation()
		SACRI_MUTILATION = true
	elseif SACRI_MUTILATION == true
	and fightCharacter:getLifePointsP() < 30
	then
		spell.mutilation()
		SACRI_MUTILATION = false
	end
end

function iaSacri.main()

	spell_mutilation()

	if fightAction:getDistance(fightCharacter:getCellId(), fightAction:getNearestEnemy()) > 8 then
		--spell.epee_vorace()
	end
	if fightAction:getDistance(fightCharacter:getCellId(), fightAction:getNearestEnemy()) >  fightCharacter:getMP() then
		spell.attirance()
	end
	if fightCharacter:getLifePointsP() < 30 then
		spell.hemoragie()
		spell.hemoragie()
	end
	spell.furie()
	spell.furie()
	spell.hemoragie()
	spell.hemoragie()
	spell.assault()
	spell.assault()
	spell.assault()
	iaMove.cac()
end

return iaSacri
