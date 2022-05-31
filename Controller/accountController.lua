local accountController = {}

function accountController.waitConnect()
	printF.debug("accountController.lua", "waitConnect()")


	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do
		while not bot.isAccountFullyConnected()
		and bot.isAccountConnected()
		do
			printF.info("On attend la connexion.")
			delayF.random(2,3)
		end
	end
	printF.info("Compte(s) connecté(s).")
end

function accountController.getGroup(serv)
	printF.debug("accountController.lua", "getGroup()")

	local group = {}

	if serv == nil then
		serv = character:server()
	end

	local idHDV = data.getIdHDV(serv)
	local idBANK = data.getIdBANK(serv)

	for _, bot in ipairs(snowbotController:getLoadedAccounts()) do
		local botId = tonumber((bot.character()).identifier())

		if serv == (bot.character()).server()
		and botId ~= idBANK
		and	botId ~= idHDV
		then
			table.insert(group, bot)
		end
	end
	return group
end

function accountController.groupIsFree()
	printF.debug("accountController.lua", "groupIsFree()")

	local group = accountController.getGroup()

	for _, bot in ipairs(group) do
		if (bot.character()).freeMode() then
			return true
		end
	end
	return false
end

function accountController.load(logsBot, autoC)
	printF.debug("accountController.lua", "load()")

	if autoC == nil then
		autoC = logsBot.autoC
	end
	if not userController.isLoad(logsBot.user) then
		printF.info("Je load " .. logsBot.alias)
		snowbotController:loadAnAccount(logsBot.user, logsBot.pass, logsBot.alias, autoC)

		if autoC == true then
			accountController.waitConnect()
		end
	else
		printF.info(logsBot.alias .. " est déjà Load.")
	end
end

function accountController.unload(bot)
	printF.debug("accountController.lua", "unload()")

	bot.stopScript()

	while (bot.global()).isInFight() do
		printF.info("Le bot " .. (bot.character()).name() .. " est en combat." )
		delayF.wait(10)
	end

	if bot.isItATeam() then
		if bot.isTeamLeader() then
			printF.info("Je déconnecte la team de " .. (bot.character()).name())
			bot.unloadAccount()
		end
	else
		printF.info("Je déconnecte " .. (bot.character()).name())
		bot.unloadAccount()
	end
	delayF.randomM(200,1000)
end

function accountController.connect(user)
	printF.debug("accountController.lua", "connect()")

	if userController.isLoad(user) then
		local bot = userController.getUserController(user)
		printF.info("Connexion de " .. bot.getAlias())

		if not bot.isAccountConnected() then
			bot.connect()
		else
			printF.info("Le bot est déja connecté.")
		end
		accountController.waitConnect()
	else
		printF.error(user .. " n'est pas load.")
	end
end

-- Lance un Script sur le compte ciblé
function accountController.launchScript(bot, path)
	printF.debug("accountController.lua", "launchScript()")

	printF.info("On lance '" .. path .. "' sur [" .. bot.getAlias() .. "].")
	bot.stopScript()
	delayF.randomM(200,500)
	bot.loadScript(path)
	delayF.random(10, 15)
	bot.startScript()
end

return accountController
