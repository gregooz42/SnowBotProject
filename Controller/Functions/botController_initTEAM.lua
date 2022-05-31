local botController_initTEAM = {}

function isOnMap(map, group)
	printF.debug("botController_initTEAM.lua", "isOnMap()")

	for _, bot in ipairs(group) do
		if (bot.map()).currentMap() ~= map then
			return false
		end
	end
	return true
end

function waitGroup(group)
	printF.debug("botController_initTEAM.lua", "waitGroup()")

	printF.info("On attend avec un délais max de 1min30 que tout le monde arrive.")

	local delayMax = 90 -- En sec
	local delayCount = 0

	while not isOnMap("5,-18", group)
	and delayCount < delayMax
	do
		delayCount = delayCount + 1
		global:delay(1000)
	end
	printF.info("Fin de l'attente du groupe")
end

function goGroup(group)
	printF.debug("botController_initTEAM.lua", "goGroup()")

	local count_crash = 0

	printF.info("On reset la pos des persos pour le groupe.")
	for _, bot in ipairs(group) do
		if (bot.map()).currentMap() ~= "5,-18"
		then -- lieux rdv
			-- On check si il est en fight
			while (bot.global()).isInFight() do
				global:delay(1000)
			end
			accountController.launchScript(bot, DIRECTORY .. "\\miniScripts\\goGroup.lua")
		end
	end
	waitGroup(group)
	-- on check et deload reload ceux qui sont pas la
	for _, bot in ipairs(group) do
		if (bot.map()).currentMap() ~= "5,-18" then
			bot.unloadAccount()
			printF.warning("Le bot " .. bot.getAlias() .. " à crash, on tente de le déco/reco.")
			count_crash = count_crash + 1
		end
	end
	if count_crash > 0 then
		servController.charge()
		goGroup(group)
	end
end

function getLogsGroup(group)
	printF.debug("botController_initTEAM.lua", "getLogsGroup()")

	local botLogs		= data.getLogs()
	local usernames		= {}
	local passwords		= {}
	local chiefUsername	= nil

	local secour_chief	= nil

	for _, botLog in ipairs(botLogs) do
		if userController.isOnGroup(botLog.user, group) then
			table.insert(usernames, botLog.user)
			table.insert(passwords, botLog.pass)
			if botLog.alias == (character:server() .. " - LEAD") then
				chiefUsername = botLog.user
			else
				secour_chief = botLog.user
			end
		end
	end

	if chiefUsername == nil then
		printF.warning("Il n'y a pas de chef de groupe, attribution d'un chef aléatoire.")
		chiefUsername = secour_chief
	end

	local dataTEAM = {
		users	= usernames,
		pass	= passwords,
		alias	= (character:server() .. " - Group"),
		chief	= chiefUsername
	}
	return dataTEAM
end

function loadGroup(group)
	printF.debug("botController_initTEAM.lua", "loadGroup()")

	local logs			= getLogsGroup(group)
	local usernames		= logs.users
	local passwords		= logs.pass
	local alias			= logs.alias
	local chiefUsername	= logs.chief
	local autoConnect	= true

	servController.decharge()

	printF.info("On attend 15s.")
	global:delay(math.random(10000,15000))

	printF.info("On charge le groupe, attente de 15s.")
	snowbotController:loadTeamAccount(usernames, passwords, alias, chiefUsername, autoConnect)
	global:delay(math.random(10000,15000))
end


function botController_initTEAM.construcTEAM(group)
	printF.debug("botController_initTEAM.lua", "construcGroup()")

	-- On rassemble les membres du groupe
	goGroup(group)
	-- On construit le groupe
	loadGroup(group)
end

return botController_initTEAM
