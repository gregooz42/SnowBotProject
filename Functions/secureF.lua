local secureF = {}

function secureF.putBank()
	printF.debug("secureF.lua", "putBank()")

	local inventoryContent = inventory:inventoryContent()

	local isTrue = false
	local items = {}

	for _, item in ipairs(inventoryContent) do
		if itemF.isIdol(item.objecttGID)
		or itemF.isFami(item.objecttGID)
		and not item.position == 8
		then
			table.insert(items, item)
			isTrue = true
		end
	end

	if isTrue
	and character:level() > 10
	then
		npc:npc(522, 3)
		npc:reply(-1)
		inventoryF.putItems(items)
		global:leaveDialog()
		delayF.randomM(250,750)
	end
end

function secureF.getBank()
	printF.debug("secureF.lua", "getBank()")

	if character:level() > 10 then
		npc:npc(522, 3)
		npc:reply(-1)
		exchange:getAllItems()
		exchange:getKamas(0)
		global:leaveDialog()
		delayF.randomM(250,750)
	end
end

return secureF
