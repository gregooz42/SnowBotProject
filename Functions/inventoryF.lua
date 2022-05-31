local inventoryF = {}

function inventoryF.deleteLowPriceRessources()
	printF.debug("inventoryF.lua", "deleteLowPriceRessources()")

	for _, item in ipairs(RESSOURCES) do
		if item.id ~= 0
		and item.del
		then
			local quantity = inventory:itemCount(item.id)
			if quantity > 0 then
				delayF.randomM(300, 200)
				printF.warning("Suppression de: [" .. inventory:itemNameId(item.id) .. "] x " .. quantity)
				inventory:deleteItem(item.id, quantity)
			end
		end
	end
end

function inventoryF.checkFami()
	printF.debug("inventoryF.lua", "checkFami()")

	printF.info("Check du famillier.")
	local inventoryContent = inventory:inventoryContent()
	local famiIsEmpty = true
	local myFami = nil
	for _, item in ipairs(inventoryContent) do
		if item.position == 8 then
			famiIsEmpty = false
			printF.success("Le famillier [" .. inventory:itemNameId(item.objecttGID) .. "] est équipé.")
		end
		if itemF.isFami(item.objecttGID) then
			myFami = item
		end
	end
	if famiIsEmpty then
		if myFami == nil then
			printF.warning("Le personnage n'à pas de famillier.")
		elseif myFami ~= nil then
			local famiName = inventory:itemNameId(myFami.objecttGID)
			if character:freeMode() then
				printF.warning("Nous ne pouvons pas équipé [" .. famiName .. "] car nous ne somme pas abonné.")
			else
				inventory:equipItem(myFami.objecttGID, 8)
				printF.success("J'équipe [" .. famiName .. "].")
			end
		end
	end
	global:leaveDialog()
end

function inventoryF.secureBank()
	printF.debug("inventoryF.lua", "secureBank()")
	npc:npc(522, 3)
    npc:reply(-1)
	exchange:putAllItems()
	global:leaveDialog()
end

function inventoryF.putItems(items)
	printF.debug("inventoryF.lua", "putItems()")

	for _, item in ipairs(items) do
		exchange:putItem(item.objecttGID, item.quantity)
		printF.info("Sécurisation de [" .. inventory:itemNameId(item.objecttGID) .. "].")
	end
	global:leaveDialog()
end


function inventoryF.getBestItem(class, level, pos)
	printF.debug("inventoryF.lua", "getBestItem()")

	local libStuff	= objectStuff.getStuff(class)
	local bestItem	= nil

	for _, item in ipairs(libStuff) do
		if item.postion == pos
		and item.niv <= level
		and (bestItem == nil or item.niv > bestItem.niv)
		then
			bestItem = item
		end
	end
	return bestItem
end

return inventoryF
