local teamCONTROLER = {}

function deconnectBotTEAM()
	printF.debug("teamCONTROLER.lua", "deconnectBotTEAM()")

	for _, serv in ipairs(SERVEUR) do

		local group = accountController.getGroup(serv.name)

		for _, bot in ipairs(group) do
			accountController.unload(bot)
		end

	end
end

function teamCONTROLER.main()
	printF.debug("hdvCONTROLER.lua", "main()")

	if toolF.isOnPlanning(delayF.getThisHour(), PLANNING_TEAM) then
		deconnectBotTEAM()
	end
end

return teamCONTROLER
