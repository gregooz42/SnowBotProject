local hdvManager = {}

RESSOURCES			= nil
HDV_ON				= true
HDV_FIRST_SALE		= true
HDV_FULL			= false
HDV_STATUS			= "hdv"
HDV_MAX_RESSOURCE	= 10
HDV_DESTRUCT		= nil
HDV_PODS			= ((inventory:podsMax() * 0.90) - 502) -- Défini les pods limites pour l'hdv 0.50 = 50%

function hdvManager.main()
	printF.debug("hdvManager.lua", "main()")

	if RESSOURCES == nil then
		RESSOURCES = objectRessources.getRessources()
	end

	if HDV_STATUS == "end" then
		return hdvFinish()
	end
	if map:onMap("192415750") then -- Bank Int
		if HDV_STATUS == "bank" then
			manageBank()
		end
		return map:moveToCell(409)
	elseif map:onMap("191104002") then -- Bank Ext
		if HDV_STATUS == "hdv" then
			return map:changeMap("bottom")
		elseif HDV_STATUS == "end" then
			return hdvFinish()
		else
			return map:door(288)
		end
	elseif map:onMap("4,-17") then -- Hdv
		if HDV_STATUS == "bank" then
			return map:changeMap("top")
		end
		manageHdv()
		return map:changeMap("top")
	else
		if not map:onMap("5,-18") then -- Zap Astrub
			printF.info("Go à l'hdv !")
			return resetF.zapAstrub()
		else
			return  map:changeMap("left")
		end
	end
end

function hdvFinish()
	printF.debug("hdvManager.lua", "hdvFinish()")

	HDV_ON = false
	HDV_FIRST_SALE = true
	BANK_START = true
	return resetF.zapAstrub()
end

function mille(v)
	local s = string.format("%d", math.floor(v))
	local pos = string.len(s) % 3
	if pos == 0 then
		pos = 3
	end
	return string.sub(s, 1, pos) .. string.gsub(string.sub(s, pos + 1), "(...)", ".%1")
end

function convertLot(nb)
	if nb == 100 then
		return 3
	elseif nb == 10 then
		return 2
	elseif nb == 1 then
		return 1
	end
end

function updateHdvPrice()
	printF.debug("hdvManager.lua", "updateHdvPrice()")

	for _, ress in ipairs(RESSOURCES) do
		if ress.id ~= 0 then
			ress.sale = 0
			for i = 1, sale:ItemsOnSale() do
				if sale:GetItemGID(i) == ress.id and sale:GetItemQuantity(i) == ress.lot and ress.sale < HDV_MAX_RESSOURCE then
					ress.sale = ress.sale + 1
					local myPrice = sale:GetItemPrice(i)
					local hdvPrice = sale:GetPriceItem(ress.id, convertLot(ress.lot))

					if myPrice ~= hdvPrice and ress.price ~= hdvPrice then
						ress.price = hdvPrice - 1
					else
						ress.price = hdvPrice
					end

					if ress.price ~= myPrice then
						if character:kamas() < (hdvPrice * (2 / 100)) then
							global:printError( "[Vente] Mise à jour impossible de " .. ress.lot .. " x [" .. inventory:itemNameId(ress.id) .. "], Vous n'avez pas : " .. (hdvPrice * (2 / 100)) .. " Kamas.")
						else
							global:printError("[Vente] Mise à jour de " .. ress.lot .. " x [" .. inventory:itemNameId(ress.id) .. "] : " .. mille(ress.price) .. " Kamas.")
							global:delay(math.random(1, 250))
							sale:EditPrice(sale:getItemGUID(i), ress.price, ress.lot)
						end
					else
						global:printMessage("[Vente] Mise à jour de " .. ress.lot .. " x [" .. inventory:itemNameId(ress.id) .. "] non nécessaire.")
					end
				end
			end
		end
	end
end

function manageHdv()
	printF.debug("hdvManager.lua", "manageHdv()")
	npc:npc(tonumber(340), 5)

	local countItemsOnSale = 0

	for _ = 1, sale:ItemsOnSale() do
		countItemsOnSale = countItemsOnSale + 1
	end

	if HDV_FIRST_SALE then
		updateHdvPrice()
	end

	for _, ress in ipairs(RESSOURCES) do

		if ress.id ~= 0 and inventory:itemCount(ress.id) > 0 and ress.sale < HDV_MAX_RESSOURCE then

			if ress.min == 0 and character:kamas() > (HDV_DESTRUCT * 10) then
				ress.min = HDV_DESTRUCT
			end
			if ress.price == 0 then
				ress.price = (sale:GetPriceItem(ress.id, convertLot(ress.lot)) - 1)
			end
			while ress.sale < HDV_MAX_RESSOURCE
			and inventory:itemCount(ress.id) >= ress.lot
			and countItemsOnSale < (character:level() * 2)
			do
				ress.sale = ress.sale + 1
				if ress.del == false then
					if ress.price <= ress.min then
						ress.del = true
					elseif sale:AvailableSpace() == 0 then
						global:printError("[Vente] Mise en vente impossible car l'hdv est plein (" .. countItemsOnSale .. "/" .. (character:level() * 2) .. ")")
					else
						global:printSuccess("[Vente] Mise en vente de " .. ress.lot .. " x [" .. inventory:itemNameId(ress.id) .. "] : " .. ress.price .. " Kamas.")
						countItemsOnSale = countItemsOnSale + 1
						sale:SellItem(ress.id, ress.lot, ress.price)
					end
				end
			end
		end
	end
	HDV_FULL = false
	if countItemsOnSale == (character:level() * 2) then
		global:printError("[Info] L'hôtel de vente est complet.")
		HDV_FULL = true
	end
	npc:leaveDialog()
	inventoryF.deleteLowPriceRessources()
	HDV_FIRST_SALE = false
	HDV_STATUS = "bank"
	map:changeMap("top")
end

function manageBank()
	printF.debug("hdvManager.lua", "manageBank()")

	local noKamas = true
	local emptyBank = true

	npc:npc(522, 3)
	npc:reply(-1)
	exchange:getKamas(0)

	if character:kamas() > 1000 then
		noKamas = false
	end

	exchange:putAllItems()

	for _, ress in ipairs(RESSOURCES) do
		if exchange:storageItemQuantity(ress.id) > 0 then
			global:printSuccess("[Banque] : " .. exchange:storageItemQuantity(ress.id) .. " [" .. inventory:itemNameId(ress.id) .. "].")

			local ressCount = ress.sale

			if not HDV_FULL
			and not noKamas
			and ressCount < HDV_MAX_RESSOURCE
			then
				if exchange:storageItemQuantity(ress.id) >= ress.lot then
					emptyBank = false
				end
				local isAbo = false
				while exchange:storageItemQuantity(ress.id) >= ress.lot
				and (inventory:pods() < HDV_PODS)
				and ressCount < HDV_MAX_RESSOURCE
				and not isAbo
				do
					if not character:freeMode() then
						exchange:getItem(ress.id, ress.lot)
						ressCount = ressCount + 1
					else
						if inventory:itemLevelId(ress.id) <= 60 then
							exchange:getItem(ress.id, ress.lot)
							ressCount = ressCount + 1
						else
							isAbo = true
						end
					end
				end
			end
		end
	end
	global:leaveDialog()

	if emptyBank or HDV_FULL or noKamas then
		if HDV_FULL then
			HDV_FULL = false
			printF.info("L'hôtel de vente est complet.")
			HDV_STATUS = "end"
		elseif noKamas then
			printF.error("Pas assez de kamas pour vendre.")
			HDV_STATUS = "end"
		elseif emptyBank then
			printF.info("Banque vide.")
			HDV_STATUS = "end"
		elseif HDV_FIRST_SALE then
			printF.info("Go à l'hdv !")
			HDV_STATUS = "hdv"
		else
			HDV_STATUS = "end"
		end
		return map:moveToCell(409)
	else
		HDV_STATUS = "hdv"
		printF.info("Go à l'hdv !")
		return map:moveToCell(409)
	end
end

return hdvManager
