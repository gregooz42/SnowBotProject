local exchangeManager = {}

function exchangeManager.secureInventory()
	printF.debug("exchangeManager.lua", "secureInventory()")

	local hdvId		= data.getIdHDV()
	local botHdv	= userController.getIdController(hdvId)
	local hdvPods	= inventoryController.getPods(botHdv)

	secureF.putBank()

	if inventory:podsP() >= 20 then

		-- Pour laisser au bot hdv le temps de wait_bot
		delayF.random(7, 10)

		printF.info("On demande l'échange au bot HDV.")
		while not exchange:LaunchExchangeWithPlayer(hdvId) do
			printF.warning("L'échange n'est pas lancé.")
			delayF.wait(10)
		end
		printF.success("L'échange est lancé.")
		if hdvPods > inventory:pods() then
			exchange:putAllItems()
		else
			local inventoryContent = inventory:inventoryContent()

			for _, object in ipairs(inventoryContent) do

				local objecttGID = tonumber(object.objecttGID)
				local quantity = tonumber(object.quantity)
				local itemWeight = inventory:itemWeight(objecttGID)
				if object.position == 63 -- Tout sauf equip
				and objecttGID ~= 10207 -- Trousseau de clef
				and  itemWeight < hdvPods then
					if itemWeight * object.quantity > hdvPods then
						quantity = hdvPods / itemWeight
						quantity = math.floor(quantity - 1)
					end
					hdvPods = hdvPods - (itemWeight * quantity)
					exchange:putItem(objecttGID, quantity)
				end
			end
		end
		delayF.random(2, 3)
		exchange:Ready()
		printF.success("L'échange est terminé.")
	end

	secureF.getBank()
end

return exchangeManager
