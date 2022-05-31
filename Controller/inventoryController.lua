local inventoryController = {}

function inventoryController.getPods(account)
	printF.debug("inventoryController.lua", "getPods()")

	local pods = 0

	pods = (account.inventory()).podsMax() - (account.inventory()).pods()

	return pods
end

function inventoryController.teamIsFull()
	printF.debug("inventoryController.lua","teamIsFull()")

	local group = accountController.getGroup()

	for _, bot in ipairs(group) do
		if (bot.inventory()).podsP() >= 80 then
			return true
		end
	end
	return false
end

function inventoryController.getInventoryEquip(account, pos)
	printF.debug("inventoryController.lua","getInventoryEquip()")

	local inventory = (account.inventory()).inventoryContent()

	local item = nil

	for _,v in ipairs(inventory) do
		if v.position == pos then
			item = v
		end
	end
	return item
end

return inventoryController
