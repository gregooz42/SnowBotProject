local hdvCONTROLER = {}

function waitBotHDV(user)
	printF.info("On attend le bot HDV")
	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do
		if bot.getUsername() == user
		and bot.isAccountConnected()
		then
			while bot.isAccountConnected() do
				global:delay(10000)
			end
		end
	end
	printF.info("Le bot HDV à terminé.")
	delayF.randomMin(5, 10)
end

function teamIsOn(serv)

	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do

		if (bot.character()).server() == serv
		and bot.isAccountConnected()
		then
			return true
		end
	end
	return false
end

function hdvCONTROLER.main()
	printF.debug("hdvCONTROLER.lua", "main()")

	if not toolF.isOnPlanning(delayF.getThisHour(), PLANNING_HDV) then
		for _, serv in ipairs(SERVEUR) do

			if not teamIsOn(serv.name) then

				local logsHDV = botController.getLogsHDV(serv.name)

				if not userController.isLoad(logsHDV.user) then
					printF.info(logsHDV.user .. " n'est pas load")
					accountController.load(logsHDV, false)
				end
				if serv.delay <= os.clock() then

					printF.info("On démarre le bot HDV de [" .. serv.name .. "] .")

					accountController.connect(logsHDV.user)

					local bot = userController.getUserController(logsHDV.user)
					local path = DIRECTORY .. "\\HDV.lua"

					accountController.launchScript(bot, path)
					waitBotHDV(logsHDV.user)
					local minute = 60
					serv.delay = os.clock() + math.random(60 * minute, 120 * minute)
					printF.info("Le bot HDV de [" .. serv.name .. "] à terminé, il part en repos pour 1 à 2 heures.")
				else
					local reposDelay = math.floor((serv.delay - os.clock()) / 60)
					printF.info("Le bot HDV de [" .. serv.name .. "] se repose durant " .. reposDelay .. " minutes.")
				end
			else
				printF.success("Le serveur " .. serv.name .. " est actif.")
			end
		end
	else
		printF.info("Les bots HDV sont en repos.")
	end
end

return hdvCONTROLER
