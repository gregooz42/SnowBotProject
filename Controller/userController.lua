local userController = {}

function userController.getBotLogs(user)
	printF.debug("userController.lua", "getBotLogs()")

	local botLogs = data.getLogs()

	for _, logs in ipairs(botLogs) do
		if logs.user == user then
			return logs
		end
	end
	printF.error("Vous demandez les logs d'un bot inexistant.")
	return nil
end

function userController.getBotName(user)
	printF.debug("userController.lua", "getBotName()")

	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do
		if bot.getUsername() == user then
			return (bot.character()).name()
		end
	end
	printF.warning("Vous demandez le nom d'un bot inexistant/non connecté User = " .. user)
	return nil
end

function userController.getLeadController()
	printF.debug("userController.lua", "getLeadController()")

	local idLEAD = tostring(data.getIdTEAMLeader())

	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do
		if (bot.character()).identifier() == idLEAD then
			return bot
		end
	end
	printF.error("Il n'y à pas de LEAD sur ce serveur.")
	return nil
end

function userController.isOnGroup(user, group)
	printF.debugM("userController.lua", "isOnGroup()")

	for _, bot in ipairs(group) do
		if bot.getUsername() == user then
			return true
		end
	end
	return false
end

function userController.getTeamUsers()
	printF.debug("userController.lua", "getTeamUsers()")

	local group = accountController.getGroup()
	local teamUsers = {}
	local count = 0

	for _, bot in ipairs(group) do
		table.insert(teamUsers, bot.getUsername())
		count = count + 1
	end
	if count == 0 then
		printF.warning("Il n'y à pas de team dispo sur ce serv.")
		return nil
	else
		return teamUsers
	end
end

function userController.getBotUser(botId)
	printF.debug("userController.lua", "getBotUser()")

	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do
		if (bot.character()).identifier() == tostring(botId) then
			return bot.getUsername()
		end
	end
	printF.warning("Vous demandez l'id d'un bot non connecté.")
	return nil
end

function userController.getBotId(user)
	printF.debug("userController.lua", "getBotId()")

	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do
		if bot.getUsername() == user then
			return (bot.character()).identifier()
		end
	end
	printF.warning("Vous demandez l'id d'un bot non connecté.")
	return nil
end

function userController.isOnServ(alias, serv)
	printF.debugM("userController.lua", "isOnServ()")

	if serv == nil then
		serv = character:server()
	end

	if alias == (serv .. " - HDV")
	or alias == (serv .. " - BANK")
	or alias == (serv .. " - LEAD")
	or alias == (serv .. " - Panda")
	or alias == (serv .. " - Feca")
	or alias == (serv .. " - Eni")
	or alias == (serv .. " - Enu")
	or alias == (serv .. " - Sadi")
	or alias == (serv .. " - Sacri")
	or alias == (serv .. " - Iop")
	or alias == (serv .. " - Ougi")
	or alias == (serv .. " - Roub")
	or alias == (serv .. " - Hupper")
	or alias == (serv .. " - Elio")
	or alias == (serv .. " - Xel")
	or alias == (serv .. " - Osa")
	or alias == (serv .. " - Zobal")
	then
		return true
	end
	return false
end

function userController.isLoad(user)
	printF.debugM("userController.lua", "isLoad()")

	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do
		if bot.getUsername() == user then
			return true
		end
	end
	return false
end

function userController.getIdController(botId)
	printF.debug("userController.lua", "getIdController()")

	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do
		if (bot.character()).identifier() == tostring(botId) then
			return bot
		end
	end
	printF.warning("Vous demandez le controller d'un bot non load.")
	return nil
end

function userController.getUserController(user)
	printF.debug("userController.lua", "getUserController()")

	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do
		if bot.getUsername() == user then
			return bot
		end
	end
	printF.warning("Vous demandez le controller d'un bot non load.")
	return nil
end

function userController.dechargeUser(user)
	printF.debug("userController.lua", "dechargeUser()")

	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do
		if bot.getUsername() == user then
			printF.info("Je décharge " .. (bot.character()).name() .. " niveau " .. (bot.character()).level() .. " Alias: " .. bot.getAlias())
			bot.unloadAccount()
			global:delay(math.random(1000, 1500))
		end
	end
end

return userController
