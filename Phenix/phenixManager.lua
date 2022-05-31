local phenixManager =  {}

function reanim(phenixPath)
	printF.debug("phenixManager.lua", "reanim()")

	-- On clic sur le Phenix
	for _, mapInfo in ipairs(phenixPath) do
		if map:currentMap() == mapInfo.map
		or tostring(map:currentMapId()) == mapInfo.map
		then
			map:door(tonumber(mapInfo.door))
		end
	end
	-- On attend que le perso soit réanimé
	delayF.wait(5)


	-- On check si on est dans le Phenix Goultard (Exception)
	if map:currentMapId() ~= 146800640 then
		map:door(300) -- Sortie Goulard
		global:delay(5000)
	end

	-- On reprend le trajet
	return map:changeMap("havenbag")
end

function phenixManager.main()
	printF.debug("phenixManager.lua", "main()")

	local phenixPath = {
		{ map = "12,12", door = "184" }, -- Chafer
		{ map = "2,-14", door = "313" }, -- Astrub
		{ map = "-10,-54", door = "342" }, -- Cania
		{ map = "146800640", door = "200"}, -- Goultard Int
	}

	if toolF.onMapPath(phenixPath) then
		return reanim(phenixPath)
	else
		return path()
	end
end

function path()
	printF.debug("phenixManager.lua", "path()")

	return {
		-- Chafer
		{map = "9,16", path = "right"},
		{map = "82314240", path = "right"},
		{map = "11,16", path = "right"},
		{map = "12,16", path = "right"},
		{map = "13,16", path = "top"},
		{map = "13,15", path = "top"},
		{map = "13,14", path = "top"},
		{map = "13,13", path = "top"},
		{map = "13,12", path = "top"},
		{map = "13,12", path = "left"},
		{map = "12,12", door = "184"},

		--Astrub
		{ map = "-3,-13", path = "right" },
		{ map = "-2,-13", path = "right" },
		{ map = "-1,-13", path = "right" },
		{ map = "0,-13", path = "right" },
		{ map = "1,-13", path = "right" },
		{ map = "2,-13", path = "top" },
		{ map = "2,-14", door = "313" },

		-- Cania
		{map = "-9,-54", path = "left"},
		{map = "-10,-54", door = "342"},

		-- Phenix Goultard
		{ map = "146800640", door = "200"}, -- Int
	}
end

return phenixManager
