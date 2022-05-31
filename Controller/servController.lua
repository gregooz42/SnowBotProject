local servController = {}

function servController.getTeamLeader()
	printF.debug("servController.lua", "getTeamLeader()")

	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do
		if character:server() == (bot.character()).server()
		and bot.isItATeam()
		and bot.isTeamLeader()
		then
			return bot
		end
	end
	printF.info("Il n'y à pas de Leader sur ce serveur.")
	return nil
end

function servController.connect()
	printF.debug("servController.lua", "connectLoadedAccounts()")

	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do
		if (bot.character()).name() ~= nil
		and character:server() == (bot.character()).server()
		then
			if not bot.isAccountConnected() then
				printF.info("Je connecte " .. (bot.character()).name() .. " niveau " .. (bot.character()).level() .. " Alias: " .. bot.getAlias())
				bot.connect()
				global:delay(math.random(500, 1000))
				return servController.connect()
			end
		end
	end
	accountController.waitConnect()
end

function servController.decharge()
	printF.debug("servController.lua", "decharge()")

	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do
		if (bot.character()).name() ~= nil
		and character:server() == (bot.character()).server()
		and bot.getAlias() ~= (character:server() .. " - BANK")
		and bot.getAlias() ~= (character:server() .. " - HDV")
		and bot.isAccountConnected() then
			printF.info("Je décharge " .. (bot.character()).name() .. " niveau " .. (bot.character()).level() .. " Alias: " .. bot.getAlias())
			bot.unloadAccount()
			global:delay(math.random(1000, 1500))
		end
	end
end

function servController.charge()
	printF.debug("servController.lua", "charge()")

	local botLogs = data.getLogs()

	for _, botLog in ipairs(botLogs) do
		if userController.isOnServ(botLog.alias)
		and not userController.isLoad(botLog.user)
		and botLog.alias ~= (character:server() .. " - BANK")
		and botLog.alias ~= (character:server() .. " - HDV")
		then
			printF.info("Je load " .. botLog.alias)
			snowbotController:loadAnAccount(botLog.user, botLog.pass, botLog.alias, botLog.autoC)
			global:delay(math.random(1000, 1500))
		end
	end

	accountController.waitConnect()
end

return servController
