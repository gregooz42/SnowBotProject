-- ////////////////////TEAM.lua//////////////////////

amakna = dofile("amakna.lua")
all50_70 = dofile("all50_70.lua")
area = dofile("area.lua")

-- La fonction move :
function move()
	printF.debug("TEAM.lua", "move()") -- Affiche dans la console

	return all50_70.main()
end


-- ////////////////all50_70.lua////////////////////////////

-- La fonction qui choisi les trajets :

function all50_70.main()
	printF.debug("all50_70.lua", "main()") -- Affiche dans la console

	if AREA_PATH == 1 then
		return amakna.campagne()
	elseif AREA_PATH == 2 then
		return amakna.dragoeufs()
	elseif AREA_PATH == 3 then
		return amakna.gelee()
	else
		return area.reset()
	end
end


-- ////////////////amakna.lua//////////////////////////

-- Voici les données de la zone campagne :

function amakna.campagne()
	printF.debug("amakna.lua", "campagne()")

	local zapId = 68419587 -- Zap Port de Madrestam
	local forbidenMonsters = {}
	local mapNext = "5,5" -- map de fin de trajet

	local mapPath = { -- Notre trajet
	-- Zap Port de Madrestam
	{ map = "7,-4", path = "bottom"},
	{ map = "7,-3", path = "bottom" },
	{ map = "7,-2", path = "bottom" },
	{ map = "7,-1", path = "bottom" },

	-- Campagne d'Amakna
	{ map = "7,0", path = "left", fight = true },
	{ map = "6,0", path = "bottom", fight = true },
	{ map = "6,1", path = "right", fight = true },
	{ map = "7,1", path = "right", fight = true },
	{ map = "8,1", path = "right", fight = true },
	{ map = "9,1", path = "bottom" },
	{ map = "9,2", path = "left", fight = true },
	{ map = "8,2", path = "left", fight = true },
	{ map = "7,2", path = "left", fight = true },
	{ map = "6,2", path = "left", fight = true },
	{ map = "5,2", path = "bottom", fight = true },
	{ map = "6,3", path = "bottom", fight = true },
	{ map = "5,4", path = "bottom", fight = true },
	{ map = "5,3", path = "right", fight = true },
	{ map = "6,4", path = "left", fight = true },
	-- FIN : 5,5
	}
	-- On return "area.main()" à la fin
	return area.main(mapPath, mapNext, zapId, forbidenMonsters)
end

-- Voici les données de la zone dragoeufs :

function amakna.dragoeufs()
	printF.debug("amakna.lua", "dragoeufs()")

	local zapId = 88212481 -- Zap Plaine des Scarafeuilles
	local forbidenMonsters = {}
	local mapNext = "-1,26" -- map de fin de trajet

	local mapPath = { -- Notre trajet
		-- Zap Scarafeuilles
	{ map = "-1,24", path = "left" },
	-- Dragoeufs
	{ map = "-2,24", path = "bottom", fight = true },
	{ map = "-2,25", path = "right", fight = true },
	{ map = "-1,25", path = "bottom", fight = true },
	-- FIN : -1,26
	}
	-- On return "area.main()" à la fin
	return area.main(mapPath, mapNext, zapId, forbidenMonsters)
end

-- On return "area.main()" à la fin , ci-dessous


-- //////////////////"area.lua"////////////////////////

-- On charge la variable global à l'initialisation grâce à un dofile()
AREA_PATH = 1 -- Zone en cour

-- La fonction qui controle le trajet :

function area.main(mapPath, mapNext, zapId, forbidenMonsters)
	printF.debug("area.lua", "main()")

	FORBIDDEN_MONSTERS = forbidenMonsters

	-- On insert le zap du début de trajet "zapId"
	local havenbag = { map = "162791424", path = "zaap(" .. tostring(zapId) .. ")"}
	table.insert(mapPath, havenbag)

	-- On insert la map de fin "mapNexp" au trajet "mapPath"
	local next = { map = mapNext, path = "havenbag"}
	table.insert(mapPath, next)

	-- oN affiche le trajet en cours
	global:printMessage("AREA_PATH = " .. AREA_PATH)

	-- Si on arrive à la fin du trajet
	if map:currentMap() == mapNext then
		global:printMessage("on augmente AREA_PATH")
		AREA_PATH = AREA_PATH + 1
	end
	-- Si le bot est sur le trajet mapPath
	if toolF.isOnMapPath(mapPath) then
		return mapPath
	-- Sinon on lance se rend au "zapId" de début de zone
	else
		return {
			{ map = map:currentMap(), path = "havenbag" },
			{ map = "162791424", path = "zaap(" .. tostring(zapId) .. ")"}, --Havre sac
		}
	end
end
