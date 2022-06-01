local cania_team = {}

function porkas()
	printF.debug("cania_team.lua", "porkas()")

	MIN_MONSTERS = 1
	MANDATORY_MONSTERS = {
		343 -- Cavalier Porkass
	}

	if GROUP_LEVEL < 180 then
		MIN_MONSTERS = 2
		MAX_MONSTERS = 4
		--config:setAmountOfSpecificMonsters({{343, 1, 3}})
	elseif GROUP_LEVEL < 230 then
		MIN_MONSTERS = 3
		MAX_MONSTERS = 5
	elseif GROUP_LEVEL < 400 then
		MIN_MONSTERS = 3
		MAX_MONSTERS = 6
	else
		MIN_MONSTERS = 5
		MAX_MONSTERS = 8
	end


	return cania.porkas()
end

function cania_team.main()
	printF.debug("cania_team.lua", "main()")

	FORBIDDEN_MONSTERS = {
	}

	MIN_MONSTERS = 1
	MAX_MONSTERS = 2

	if GROUP_LEVEL < 300 then
		return porkas()
	else
		return porkas()
	end
end

return cania_team
