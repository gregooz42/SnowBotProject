local exchangeController = {}

KAMAS_TO_GIVE = nil

function exchangeController.getKamasToGive()
	printF.debug("exchangeController.lua", "getKamasToGive()")

	local kamasToGive = {}
	local group = accountController.getGroup()

	-- Pour chaque bot du group
	for _, bot in ipairs(group) do

		local class = (bot.character()).breed()
		local level = (bot.character()).level()
		local name = (bot.character()).name()

		local data = {
			id = tonumber((bot.character()).identifier()),
			kamas = 0 - ((bot.character()).kamas() - kamasF.getSecure(level)),
			nivStuff = 0
		}
		printF.info("On check le stuff de " .. name .. " niveau " .. level)

		for pos = 0, 15, 1 do -- Tous les équips

			local item = inventoryController.getInventoryEquip(bot, pos)
			local bestItem = inventoryF.getBestItem(class, level, pos)

			if item ~= nil then
				data.nivStuff = data.nivStuff + (bot.inventory()).itemLevelId(item.objecttGID)
			end
			if bestItem ~= nil
			and (item == nil or bestItem.id ~= item.objecttGID)
			then
				data.kamas = data.kamas + bestItem.price
				printF.info("Meilleur item trouvé [" .. (bot.inventory()).itemNameId(bestItem.id) .. "] Prix: " .. bestItem.price)
			end
		end
		printF.info("Check terminé.")
		table.insert(kamasToGive, data)
	end
	-- sort ascending by nivStuff
	table.sort(kamasToGive, function(a,b) return a.nivStuff < b.nivStuff end)

	-- On vérifie par rapport à nos kamas
	local myKamas = character:kamas() - ABO_PRICE

	for _, bot in ipairs(kamasToGive) do
		if bot.kamas < 0 then
			bot.kamas = 0
		end
		if bot.kamas > 0 then
			if myKamas > bot.kamas then
				myKamas = myKamas - bot.kamas
			else
				bot.kamas = 0
			end
		end
	end

	return kamasToGive
end

function botIsEmpty(bot)
	printF.debugM("exchangeController.lua", "botIsEmpty()")

	if (bot.map()).currentMapId() ~= 192415750 -- Int Bank Astrub
	and (bot.inventory()).podsP() < 20 then
		return true
	end

	return false
end

function waitExchange(bot)
	printF.debug("exchangeController.lua", "waitExchange()")

	while not botIsEmpty(bot) do
		printF.info("On attend l'échange.")
		if developer:suspendScriptUntil("ExchangeRequestedTradeMessage", 10000, false) then
			printF.info("Lancement d'un échange !")
			while not developer:suspendScriptUntil("ExchangeIsReadyMessage", 10000, false) do
				printF.info("On attend l'acceptation de l'échange.")
			end
			printF.info("Echange terminé !")
		end
	end
	printF.info("Bot vide.")
end

function exchangeController.manageTeamInventory()
	printF.debug("exchangeController.lua", "manageTeamInventory()")

	local teamUsers = userController.getTeamUsers()

	if teamUsers ~= nil then

		KAMAS_TO_GIVE = exchangeController.getKamasToGive()
		-- On décharge groupe
		local botLEAD = servController.getTeamLeader()
		if botLEAD ~= nil then
			botLEAD.unloadAccount()
		end


		config:setIgnoreExchangeRequest(false)

		-- On gère les bots un par un
		for _, user in ipairs(teamUsers) do

			if inventory:podsP() > 10 then
				printF.info("On se vide à la banque")
				inventoryF.secureBank()
			end

			local botLogs = userController.getBotLogs(user)
			accountController.load(botLogs)
			local bot = userController.getUserController(user)
			if not botIsEmpty(bot) then
				accountController.launchScript(bot, DIRECTORY .. "\\miniScripts\\goBank.lua")
				waitExchange(bot)
			end
		end

	end
end

return exchangeController
