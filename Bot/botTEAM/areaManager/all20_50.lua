local all20_50 = {}

function all20_50.main()
	printF.debug("all20_50.lua", "main()")

	MIN_MONSTERS = 1
	MAX_MONSTERS = 1

	if map:currentSubArea() == "Campagne d'Amakna"
	or map:currentSubArea() == "Rives iridescentes"
	then
		AREA_IDOLS = 2
		MIN_MONSTERS = 5
		MAX_MONSTERS = 8
	else
		AREA_IDOLS = 1
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
	end

	area.idols()

	if AREA_PATH == 1 then
		return amakna.campagne()
	elseif AREA_PATH == 2 then
		return cania.lac()
	elseif AREA_PATH == 3 then
		return bonta.rives()
	elseif AREA_PATH == 4 then
		return cania.champs()
	else
		return area.reset()
	end
end

return all20_50
