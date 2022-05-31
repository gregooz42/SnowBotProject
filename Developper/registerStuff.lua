local registerStuff = {}

SERVER_ITEM	= nil

function registerStuff.main()
	printF.debug("registerStuff.lua", "main()")

	developer:registerMessage("ExchangeTypesItemsExchangerDescriptionForUserMessage", buyBestItem)
end

function registerStuff.launchBuyBestItem(itemId, itemPrice)
	printF.debug("registerStuff.lua", "launchBuyBestItem()")

	SERVER_ITEM = {id = itemId, price = itemPrice}
	global:delay(1000)
	openItem(itemId)
end

function openItem(itemId)
	printF.debug("registerStuff.lua", "openItem()")

    local monMessage = developer:createMessage("ExchangeBidHouseSearchMessage")
    monMessage.genId = itemId
    monMessage.follow = true
    developer:sendMessage(monMessage)
	developer:suspendScriptUntil("ExchangeTypesItemsExchangerDescriptionForUserMessage", 20000, true)
end

function getItemPoid(effect, poidClass)
	printF.debug("registerStuff.lua", "getItemPoid()")


	local poidTotal = 0

	for _, eff in ipairs(effect) do
		for _, stat in pairs(poidClass) do
			if stat.id == eff.actionId then
				poidTotal = poidTotal + stat.poid * eff.value
			end
		end
	end
	return poidTotal
end

function buyThisItem(itemUID, itemPrice)
	printF.debug("registerStuff.lua", "buyItem()")

	if itemUID ~= -1
	and itemPrice ~= -1 then
		local monMessage = developer:createMessage("ExchangeBidHouseBuyMessage")
		monMessage.uid = tonumber(itemUID)
		monMessage.qty = 1
		monMessage.price = tonumber(itemPrice)
		developer:sendMessage(monMessage)
		developer:suspendScriptUntil("ObjectAddedMessage", 5000, true)
		SERVER_ITEM = nil
		printF.success("Item acheté !")
	else
		printF.warning("Le prix est supérieur à " .. tostring(itemPrice) .. " Kamas.")
	end
end

function buyBestItem(message)
	printF.debug("registerStuff.lua", "buyBestItem()")

	local itemsOnSell = message.itemTypeDescriptions
	local itemPoid = 0
	local itempPrice = -1
	local itemUID	= -1
	local poidClass =  objectStuffPoid.getPoid()

	for _, item in ipairs(itemsOnSell) do
		local thisEffect = item.effects
		local thisPrice = item.prices
		local thisPoid = getItemPoid(thisEffect, poidClass)
		if tonumber(thisPrice[1]) <= SERVER_ITEM.price
		and tonumber(thisPrice[1]) ~= 0
		and thisPoid > itemPoid
		then
			global:printMessage("Poid:" .. tostring(thisPoid))
			global:printMessage("Prix: " .. tostring(thisPrice[1]))
			itempPrice = thisPrice[1]
			itemUID = item.objecttUID
			itemPoid = thisPoid
		end
	end

	if itemUID ~= -1 then
		printF.info("Item trouvé ! " .. tostring(itemUID) .. " " .. tostring(itempPrice))
		buyThisItem(itemUID, itempPrice)
	else
		printF.warning("L'item n'est pas en vente.")
	end
end

return registerStuff
