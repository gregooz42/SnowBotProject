local all50_70 = {}

function all50_70.main()
	printF.debug("all50_70.lua", "main()")

	MIN_MONSTERS = 2
	MAX_MONSTERS = 4

	if map:currentSubArea() == "Campagne d'Amakna"
	or map:currentSubArea() == "Rives iridescentes"
	then
		AREA_IDOLS = 2
		MIN_MONSTERS = 5
		MAX_MONSTERS = 8
	elseif map:currentSubArea() == "Péninsule des gelées"
	or map:currentSubArea() == "Bordure de Brâkmar"
	then
		AREA_IDOLS = 1
		MIN_MONSTERS = 5
		MAX_MONSTERS = 8
	else
		AREA_IDOLS = 1
		if GROUP_LEVEL < 800 then
			MIN_MONSTERS = 4
			MAX_MONSTERS = 6
		else
			MIN_MONSTERS = 4
			MAX_MONSTERS = 8
		end
	end

	area.idols()

	if AREA_PATH == 1 then
		return amakna.campagne()
	elseif AREA_PATH == 2 then
		return amakna.dragoeufs()
	elseif AREA_PATH == 3 then
		return amakna.gelee()
	elseif AREA_PATH == 4 then
		return brakmar.bordure()
	elseif AREA_PATH == 5 then
		return sidimote.desolation()
	else
		return area.reset()
	end
end

return all50_70
