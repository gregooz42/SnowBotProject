local stuffController = {}

function isGoStuff(account)
	printF.debug("stuffController.lua", "goGroup()")

	local class = (account.character()).breed()
	local level = (account.character()).level()

	local botKamas = (account.character()).kamas() - kamasF.getSecure(level)

	printF.info("On check le stuff de " .. (account.character()).name() .. " niveau " .. level)

	for pos = 0, 15, 1 do -- Tous les équips

		local item = inventoryController.getInventoryEquip(account, pos)
		local bestItem = inventoryF.getBestItem(class, level, pos)

		if bestItem ~= nil
		and (item == nil or bestItem.id ~= item.objecttGID)
		and (bestItem.price < botKamas)
		then
			printF.info("Le bot [" .. (account.character()).name() .. "] doit se stuff !")
			return true
		end
	end
	printF.info("Le bot [" .. (account.character()).name() .. "] est à jour.")
	return false
end

function getBotGoStuff()
	printF.debug("stuffController.lua", "getBotGoStuff()")

	local group = accountController.getGroup()
	local botGoStuff = {}
	local count = 0

	for _, bot in ipairs(group) do
		if isGoStuff(bot) then
			count = count + 1
			table.insert(botGoStuff, bot)
		end
	end
	if count == 0 then
		return nil
	else
		return botGoStuff
	end

end

--accountController:getTeamAccounts()
function stuffController.main()
	printF.debug("stuffController.lua", "main()")

	local botGoStuff = getBotGoStuff()

	if botGoStuff ~= nil then

		-- On gère les bots un par un
		for _, bot in ipairs(botGoStuff) do

			local botId = tonumber((bot.character()).identifier())

			ID_TO_WAIT = botId

			accountController.launchScript(bot, DIRECTORY .. "\\miniScripts\\goStuff.lua")

			-- On attend que le bot ai fini de se stuff (un mp)
			while ID_TO_WAIT == botId do
				printF.info("On attend un MP de " .. (bot.character()).name())
				developer:suspendScriptUntil("ChatServerMessage", 30000, true)
				global:delay(1000)
			end
		end
	end
end

return stuffController
