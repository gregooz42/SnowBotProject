local botController = {}

botController_initTEAM = dofile("scripts\\Controller\\Functions\\botController_initTEAM.lua")

function botController.getLogsHDV(serv)
	printF.debug("botController.lua", "getLogsHDV()")

	local botLogs = data.getLogs()
	if serv == nil then
		serv = character:server()
	end

	for _, logs in ipairs(botLogs) do
		if logs.alias == (serv .. " - HDV") then
			return logs
		end
	end
	return nil
end

function botController.initHDV()
	printF.debug("botController.lua", "initHDV()")

	local logsHDV = botController.getLogsHDV()

	if logsHDV ~= nil then
		accountController.load(logsHDV)
		local botHDV = userController.getUserController(logsHDV.user)
		if not botHDV.isAccountConnected() then
			botHDV.connect()
			accountController.waitConnect()
		end
		local path = DIRECTORY .. "\\HDV.lua"
		accountController.launchScript(botHDV, path)
	else
		printF.error("Il n'existe pas de bot HDV sur ce serveur.")
	end
end

function groupIsReady(group)
	printF.debug("botController.lua", "groupIsReady()")

	if group == nil then
		return true
	end
	for _, bot in ipairs(group) do
		if not bot.isItATeam()
		then -- lieux rdv
			return false
		end
	end
	return true
end

function botController.initTEAM()
	printF.debug("botController.lua", "initTEAM()")

	servController.charge()

	-- On check les groupes
	local group = accountController.getGroup()

	if not groupIsReady(group)
	then
		printF.info("Création du groupe.")
		botController_initTEAM.construcTEAM(group)
		printF.info("Le groupe est créé.")

		local botLEAD = userController.getLeadController()
		local path = DIRECTORY .. "\\TEAM.lua"
		accountController.launchScript(botLEAD, path)
	else
		printF.info("Il n'y a pas de groupe à créer.")
	end
end

return botController
