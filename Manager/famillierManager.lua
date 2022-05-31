local famillierManager =  {}

FAMILLIER_ON = true
FAMILLIER_RESET_POS = true

function famillierFinish()
	printF.debug("famillierManager.lua", "famillierFinish()")
	FAMILLIER_RESET_POS = true
	FAMILLIER_ON = false
	printF.info("Le famillier est à jour.")
	return map:changeMap("right")
end

function famillierManager.main()
	printF.debug("famillierManager.lua", "main()")

	FAMILLIER_ON = false
	local libFamillier = objectFamilliers.getFamilliers()
	local myInventory = inventory:inventoryContent()

	-- On check si l'on à un famillier équipé
	local slotEmpty = true
	local kamasSecure = kamasF.getSecure()

	for _, item in ipairs(myInventory) do
		if item.position == 8 then
			slotEmpty = false
		end
	end
	if slotEmpty then
		for _, fami in ipairs(libFamillier) do
			if fami.postion == 8 then
				if	fami.niv < character:level()
				and slotEmpty
				and not fami.not_onsell
				and fami.price < (character:kamas() + kamasSecure) then	-- On vérifie le prix
					fami.go_buy = true
					FAMILLIER_ON = true
					slotEmpty = false
				end
			end
		end
	end

	-- On check la lib famillier voir si il y a mieux
	local nivTemp = -1

	for _, item in ipairs(myInventory) do
		if item.position == 8 then
			for _, fami in ipairs(libFamillier) do
				if	fami.niv < character:level()
				and fami.id ~= item.objecttGID
				and nivTemp < fami.niv
				and not fami.not_onsell
				and fami.price < (character:kamas() + kamasSecure)
				then					-- On vérifie le prix
					nivTemp = fami.niv
					fami.go_buy = true
					FAMILLIER_ON = true
				end
			end
		end
	end

	-- chargement du trajet apres check
	if not FAMILLIER_ON then
		return famillierFinish()
	end
	if map:onMap("212861955") then  -- Zap brack
		FAMILLIER_RESET_POS = false
	end
	if FAMILLIER_RESET_POS then
		return resetF.zapBrack()
	end
	if not map:onMap("212862469") then -- HDV famillier brack
		return resetF.creatureBrack()
	end

	-- On achete les familliers
	for _, fami in ipairs(libFamillier) do
		if fami.go_buy then
			npc:npc(tonumber(456), 6) -- hdv equip brack
			global:delay(9000)
			if inventory:itemCount(fami.id) < 1 then
				registerStuff.launchBuyBestItem(fami.id, fami.price)
			end
			global:delay(2000)
			global:leaveDialog()
			global:delay(3000)
			if inventory:itemCount(fami.id) >= 1 then
				inventory:equipItem(fami.id, fami.postion)
				printF.success("L'équipement [" .. inventory:itemNameId(fami.id) .. "] niveau " .. inventory:itemLevelId(fami.id) .. " est équipé !")
			else
				printF.warning("L'achat de [" .. inventory:itemNameId(fami.id) .. "] est reporté.")
				fami.not_onsell = true
			end
			fami.go_buy = false
			global:delay(3000)
		end
	end

	return famillier_finish()
end

return famillierManager
