local stuffManager =  {}

STUFF_ON = true

function stuffFinish()
	printF.debug("stuffManager.lua", "stuffFinish()")

	STUFF_RESET_POS = true
	STUFF_ON = false
	printF.info("Les équipements sont à jour.")
	return move()
end

function openHdvEquip(type)
	printF.debug("stuffManager.lua", "openHdvEquip()")

	local action = 6
	if type == "sell" then
		action = 5
	end
	if map:currentArea() == "Astrub" then
		npc:npc(tonumber(325), action) -- hdv equip astrub
	else
		npc:npc(tonumber(456), action) -- hdv equip brack
	end
end

function stuffManager.main()
	printF.debug("stuffManager.lua", "main()")

	STUFF_ON = false
	local libStuff = objectStuff.getStuff()
	local myInventory = inventory:inventoryContent()
	local kamasSecure = kamasF.getSecure()
	local kamas = (character:kamas() - kamasSecure)

	-- On check si il y a des emplacements vides
	for i = 0, 15 do

		local emptySlot = true

		for _, item in ipairs(myInventory) do
			if item.position == i then
				emptySlot = false
			end
		end
		if emptySlot then

			local iItem = -1

			for j, stuff in ipairs(libStuff) do
				if stuff.postion == i and emptySlot then
					if	stuff.niv <= character:level() and not stuff.not_onsell
					and stuff.price < kamas
					then					-- On vérifie le prix
						iItem = j
						emptySlot = false
					end
				end
			end

			if emptySlot == false then
				for j, stuff in ipairs(libStuff) do
					if stuff.postion == i then
						if	stuff.niv <= character:level()
						and stuff.niv > libStuff[iItem].niv
						and not stuff.not_onsell
						and stuff.price < kamas
						then
							iItem = j
						end
					end
				end
			end
			if emptySlot == false then
				libStuff[iItem].go_buy = true
				STUFF_ON = true
				kamas = kamas - libStuff[iItem].price
			end
		end
	end


	-- On check la lib stuff voir si il y a mieux
	for _, item in ipairs(myInventory) do
		if item.position < 16 then

			local iStuff = -1

			for j, stuff in ipairs(libStuff) do
				if stuff.postion == item.position then	-- On vérifie la postion (armes etc..)
					if	stuff.niv <= character:level()
					and inventory:itemLevelId(stuff.id) > inventory:itemLevelId(item.objecttGID)	-- On vérifie le niveau
					and not stuff.not_onsell
					and stuff.price < kamas
					and (iStuff == -1 or libStuff[iStuff].niv < stuff.niv)
					then					-- On vérifie le prix
						if not character:freeMode() then
							iStuff = j
						else
							if stuff.niv <= 60 then
								iStuff = j
							end
						end
					end
				end
			end
			if iStuff ~= -1 then
				libStuff[iStuff].go_buy = true
				STUFF_ON = true
				kamas = kamas - libStuff[iStuff].price
			end
		end
	end


	-- chargement du trajet apres check
	if not STUFF_ON then
		return stuffFinish()
	end

	if not map:onMap("212860930") -- Hdv equip brack
	and not (map:onMap("6,-17") and character:freeMode()) -- Hdv equip astrub
	then -- HDV equip brack
		if character:freeMode() then
			return resetF.equipAstrub()
		else
			return resetF.equipBrack()
		end
	end

	global:delay(math.random(500, 1500))


	-- On achete les stuffs
	for _, stuff in ipairs(libStuff) do
		if stuff.go_buy then
			printF.info("Je recherche l'équipement [" .. inventory:itemNameId(stuff.id) .. "] niveau " .. inventory:itemLevelId(stuff.id))
			if inventory:itemCount(stuff.id) < 1 then
				openHdvEquip()
				registerStuff.launchBuyBestItem(stuff.id, stuff.price)
				global:leaveDialog()
				global:delay(math.random(1500,2500))
			end
		end
	end

	global:delay(math.random(1500, 5000))

	for _, stuff in ipairs(libStuff) do
		if stuff.go_buy then
			if inventory:itemCount(stuff.id) >= 1 then
				global:delay(math.random(1500, 5000))
				inventory:equipItem(stuff.id, stuff.postion)
				printF.success("L'équipement [" .. inventory:itemNameId(stuff.id) .. "] niveau " .. inventory:itemLevelId(stuff.id) .. " est équipé !")
			else
				printF.info("L'achat de [" .. inventory:itemNameId(stuff.id) .. "] est reporté.")
				stuff.not_onsell = true
			end
			stuff.go_buy = false
		end
	end

	global:delay(math.random(500, 1500))
	global:leaveDialog()

	return stuffFinish()
end

return stuffManager
