local idolsF = {}

function idolsF.secureIdol()
	printF.debug("idolsF.lua", "secureIdol()")

	global:delay(1000)
	printF.info("Je suis dans l'Havre Sac.")
	START_SCRIPT = false
	map:door(313)
	global:delay(math.random(500,1000))

	local inventory = inventory:inventoryContent()
	-- On met les idoles dans le coffre
	for _, object in ipairs(inventory) do
		if object.position == 63
		and itemF.isIdol(object.objecttGID) then
			printF.info("On met " .. object.objecttGID .. " dans le Coffre du Havre Sac")
			exchange:putItem(object.objecttGID, 1)
		end
	end
	global:leaveDialog()
	return map:changeMap("havenbag")
end

function idolsF.recupIdols()
	printF.debug("go_group.lua", "recupIdols()")

	global:delay(1000)
	printF.info("Je suis dans l'Havre Sac.")
	map:door(313)
	global:delay(math.random(500,1000))
	printF.info("Je récupère les idoles.")
	exchange:getAllItems()
	global:leaveDialog()
	return map:changeMap("havenbag")
end

return idolsF
