local resetF = {}

function resetF.checkMapNoHavenbag()
	printF.debug("resetF.lua", "checkMapNoHavenbag()")

	if map:onMap("146800640") -- phenix Goultard
	or map:onMap("192415750") -- Bnaque int astrub
	then
		return true
	end
	return false
end

function resetF.mapNoHavenbag()
	printF.debug("resetF.lua", "mapNoHavenbag()")

	return {
		{map = "146800640", door = "333"}, -- sortie phenix goultard
		{ map = "192415750", path = "409"}, -- Astrub bank int
	}
end

function resetF.bankAstrub()
	printF.debug("resetF.lua", "bankAstrub()")

	if map:onMap("5,-18") then return map:changeMap("left")
	elseif map:onMap("191104002") then return map:door(288) -- Ext bank astrub
	elseif map:onMap("192415750") then -- Int bank astrub
		printF.warning("Rajoutez 'if not map:onMap()'", "192415750")
	else
		return resetF.zapAstrub()
	end
end

function resetF.zapAstrub()
	printF.debug("resetF.lua", "zapAstrub()")

	if map:currentArea() == "Incarnam" then
		return resetF.incarnamToAstrub()
	end
	if character:freeMode() then
		return zapAstrubFree()
	else
		if resetF.checkMapNoHavenbag() then
			return resetF.mapNoHavenbag()
		end
		return zapAstrubAbo()
	end
end



function resetF.zapRivageSufokien()
	printF.debug("resetF.lua", "zapRivageSufokien()")

	return {
		{map = "162791424", path = "zaap(88085249)"}, --Havre sac vers Zaap rivage sufokien
	}
end

function resetF.zapPortDeMadrestam()
	printF.debug("resetF.lua", "zapPortDeMadrestam()")

	return {
		{map = "162791424", path = "zaap(68419587)"}, --Havre sac vers Zaap rivage sufokien
	}
end


function resetF.zapBonta()
	printF.debug("resetF.lua", "zapBonta()")

	return {
		{map = map:currentMap(), path = "havenbag"}, --Hors du chemin
		{map = "162791424", path = "zaap(88213271)"}, --Havre sac vers Zaap Astrub
	}
end

function resetF.zapBrack()
	printF.debug("resetF.lua", "zapBrack()")

	return {
		{map = map:currentMap(), path = "havenbag"}, --Hors du chemin
		{map = "162791424", path = "zaap(212861955)"}, --Havre sac vers Zaap Astrub
	}
end


function resetF.equipBrack()
	printF.debug("resetF.lua", "equipBrack()")

	local path = {
		{map = "191105026", path = "havenbag"}, -- Zap astrub
		{map = "162791424", path = "zaap(212861955)"}, --Havre sac vers Zaap Brack
		{map = "212861955", path = "left"}, -- Zap Brack
		{map = "-28,36", path = "top"},
	}
	if not toolF.isOnMapPath(path) then
		return resetF.zapBrack()
	end
	return path
end

function resetF.equipAstrub()
	printF.debug("resetF.lua", "equipAstrub()")

	local path = {
		{map = "5,-18", path = "right"}, -- Zap Astrub
		{map = "6,-18", path = "bottom"},
	}
	if not toolF.isOnMapPath(path) then
		return resetF.zapAstrub()
	end
	return path
end

function resetF.creatureBrack()
	printF.debug("resetF.lua", "creatureBrack()")

	return {
		{map = "212861955", path = "right"}, -- Zap Brack
		{map = "-25,37", path = "bottom"}, -- Zap Brack
	}
end

function npcIncarnamPortal()
	printF.debug("resetF.lua", "npcIncarnamPortal()")

	printF.info("On descend à Astrub.")
	npc:npc(4398,3)
	npc:reply(-1)
	npc:reply(-1)
end

function resetF.incarnamToAstrub()
	printF.debug("resetF.lua", "incarnamToAstrub())")

	 -- On quitte incarnam
	return {
		{ map = "192415750", door = "409"},
		{ map = "152045573", path = "right" }, -- 152045573
		{ map = "152046597", path = "right"}, -- 152045573
		{ map = "-2,-3", path = "right" }, -- 154010883
		{ map = "-2,-2", path = "top" }, -- 154010882
		{ map = "-1,-2", path = "top"}, -- 154010370
		{ map = "0,-2", path = "top"}, -- 153878786
		{ map = "1,-2", path = "top"}, -- 153879298
		{ map = "1,-3", path = "right" }, -- 153879299
		{ map = "0,-3", path = "right"}, -- 153878787
		{ map = "-1,-3", path = "right"}, -- 154010371
		{ map = "-1,-4", path = "bottom"}, -- 154010372
		{ map = "0,-4", path = "bottom" }, -- 153878788
		{ map = "0,-5", path = "bottom"}, -- 153878789
		{ map = "-1,-5", path = "right" }, -- 154010373
		{ map = "-2,-5", path = "right"}, -- 154010885
		{ map = "-2,-4", path = "bottom"}, -- 154010884
		{ map = "2,-3", path = "right"}, -- 153879811
		{ map = "153880323", path = "right"}, -- 153880323 On se stuff puis on va a droite
		{ map = "153880835", custom = npcIncarnamPortal}, -- 153880835 Descente à astrub
		{ map = "192416776", path = "left"}, -- 192416776
	}
end

function zapAstrubAbo()
	printF.debug("resetF.lua", "zapAstrubAbo()")

	return {
		{map = map:currentMap(), path = "havenbag"}, --Hors du chemin
		{map = "162791424", path = "zaap(191105026)"}, --Havre sac vers Zaap Astrub
	}
end

function zapAstrubFree()
	printF.debug("resetF.lua", "zapAstrubFree()")

	return {
		{ map = "5,-18", path = "left"},

		{ map = "192415750", path = "409"}, -- Astrub bank int
		{ map = "191104002", path = "right"}, -- ext
		{ map = "4,-17", path = "right"},
		{ map = "5,-19", path = "left"},
		{ map = "4,-19", path = "bottom"},
		{ map = "6,-18", path = "left"},
		{ map = "4,-20", path = "bottom"},
		{ map = "5,-20", path = "left"},
		{ map = "6,-20", path = "left"},
		{ map = "7,-20", path = "left"},
		{ map = "7,-21", path = "bottom"},
		{ map = "6,-21", path = "bottom"},
		{ map = "5,-21", path = "bottom"},
		{ map = "4,-21", path = "bottom"},
		{ map = "3,-21", path = "bottom"},
		{ map = "3,-20", path = "right"},
		{ map = "2,-20", path = "right"},
		{ map = "2,-21", path = "bottom"},
		{ map = "1,-21", path = "bottom"},
		{ map = "1,-20", path = "right"},
		{ map = "1,-19", path = "bottom"},
		{ map = "1,-17", path = "bottom"},
		{ map = "1,-15", path = "top"},
		{ map = "2,-18", path = "bottom"},
		{ map = "2,-16", path = "right"},
		{ map = "2,-19", path = "bottom"},
		{ map = "1,-18", path = "bottom"},
		{ map = "2,-17", path = "bottom"},
		{ map = "1,-16", path = "right"},
		{ map = "2,-15", path = "top"},
		{ map = "3,-15", path = "top"},
		{ map = "3,-16", path = "right"},
		{ map = "4,-16", path = "right"},
		{ map = "4,-15", path = "top"},
		{ map = "5,-15", path = "top"},
		{ map = "6,-15", path = "top"},
		{ map = "7,-15", path = "top"},
		{ map = "7,-16", path = "left"},
		{ map = "6,-16", path = "left"},
		{ map = "5,-16", path = "top"},
		{ map = "5,-17", path = "top"},
		{ map = "3,-17", path = "right"},
		{ map = "3,-18", path = "right"},
		{ map = "6,-17", path = "left"},
		{ map = "6,-19", path = "left"},
		{ map = "7,-17", path = "top"},
		{ map = "7,-18", path = "top"},
		{ map = "7,-19", path = "top"},
		{ map = "3,-19", path = "right"},
		{ map = "9,-8", path = "top"},
		{ map = "8,-8", path = "top"},
		{ map = "2,-9", path = "top"},
		{ map = "3,-9", path = "top"},
		{ map = "3,-8", path = "top"},
		{ map = "2,-8", path = "top"},
		{ map = "4,-9", path = "top"},
		{ map = "5,-9", path = "top"},
		{ map = "6,-9", path = "top"},
		{ map = "7,-9", path = "top"},
		{ map = "8,-9", path = "top"},
		{ map = "9,-9", path = "top"},
		{ map = "9,-10", path = "top"},
		{ map = "10,-10", path = "top"},
		{ map = "10,-11", path = "top"},
		{ map = "11,-11", path = "top"},
		{ map = "11,-12", path = "left"},
		{ map = "10,-12", path = "top"},
		{ map = "9,-12", path = "top"},
		{ map = "8,-12", path = "top"},
		{ map = "7,-12", path = "top"},
		{ map = "6,-12", path = "top"},
		{ map = "5,-12", path = "top"},
		{ map = "4,-12", path = "top"},
		{ map = "3,-12", path = "top"},
		{ map = "2,-12", path = "top"},
		{ map = "1,-12", path = "top"},
		{ map = "0,-12", path = "top"},
		{ map = "-1,-12", path = "top"},
		{ map = "-2,-12", path = "top"},
		{ map = "-3,-12", path = "top"},
		{ map = "-3,-11", path = "top"},
		{ map = "-2,-11", path = "top"},
		{ map = "-1,-11", path = "top"},
		{ map = "0,-11", path = "top"},
		{ map = "1,-11", path = "top"},
		{ map = "2,-11", path = "top"},
		{ map = "3,-11", path = "top"},
		{ map = "4,-11", path = "top"},
		{ map = "5,-11", path = "top"},
		{ map = "6,-11", path = "top"},
		{ map = "7,-11", path = "top"},
		{ map = "8,-11", path = "top"},
		{ map = "9,-11", path = "top"},
		{ map = "8,-10", path = "top"},
		{ map = "7,-10", path = "top"},
		{ map = "6,-10", path = "top"},
		{ map = "5,-10", path = "top"},
		{ map = "4,-10", path = "top"},
		{ map = "3,-10", path = "top"},
		{ map = "2,-10", path = "top"},
		{ map = "1,-10", path = "top"},
		{ map = "0,-10", path = "top"},
		{ map = "-1,-10", path = "top"},
		{ map = "-2,-10", path = "top"},
		{ map = "-3,-10", path = "top"},
		{ map = "-3,-9", path = "top"},
		{ map = "-1,-9", path = "top"},
		{ map = "-2,-9", path = "top"},
		{ map = "0,-9", path = "top"},
		{ map = "1,-9", path = "top"},
		{ map = "8,-18", path = "top"},
		{ map = "8,-19", path = "top"},
		{ map = "8,-20", path = "top"},
		{ map = "8,-17", path = "bottom"},
		{ map = "8,-16", path = "bottom"},
		{ map = "8,-15", path = "left"},
		{ map = "9,-15", path = "left"},
		{ map = "10,-15", path = "left"},
		{ map = "11,-15", path = "left"},
		{ map = "12,-15", path = "left"},
		{ map = "12,-16", path = "left"},
		{ map = "11,-16", path = "left"},
		{ map = "10,-16", path = "left"},
		{ map = "9,-16", path = "left"},
		{ map = "9,-17", path = "left"},
		{ map = "10,-17", path = "left"},
		{ map = "11,-17", path = "left"},
		{ map = "12,-17", path = "left"},
		{ map = "11,-18", path = "left"},
		{ map = "12,-18", path = "left"},
		{ map = "9,-18", path = "left"},
		{ map = "9,-19", path = "left"},
		{ map = "10,-19", path = "left"},
		{ map = "10,-18", path = "left"},
		{ map = "9,-20", path = "left"},
		{ map = "10,-20", path = "left"},
		{ map = "11,-20", path = "left"},
		{ map = "11,-19", path = "left"},
		{ map = "12,-20", path = "left"},
		{ map = "12,-19", path = "left"},
		{ map = "12,-21", path = "left"},
		{ map = "11,-21", path = "left"},
		{ map = "10,-21", path = "left"},
		{ map = "9,-21", path = "left"},
		{ map = "8,-21", path = "left"},
		{ map = "-3,-21", path = "right"},
		{ map = "-3,-20", path = "right"},
		{ map = "-3,-19", path = "right"},
		{ map = "-3,-18", path = "right"},
		{ map = "-3,-17", path = "right"},
		{ map = "-3,-16", path = "right"},
		{ map = "-3,-15", path = "right"},
		{ map = "-3,-14", path = "right"},
		{ map = "-3,-13", path = "right"},
		{ map = "-2,-14", path = "right"},
		{ map = "-1,-14", path = "right"},
		{ map = "0,-14", path = "right"},
		{ map = "1,-14", path = "top"},
		{ map = "2,-14", path = "top"},
		{ map = "3,-14", path = "top"},
		{ map = "4,-14", path = "top"},
		{ map = "5,-14", path = "top"},
		{ map = "6,-14", path = "top"},
		{ map = "7,-14", path = "top"},
		{ map = "8,-14", path = "top"},
		{ map = "9,-14", path = "top"},
		{ map = "10,-14", path = "top"},
		{ map = "11,-14", path = "top"},
		{ map = "11,-13", path = "top"},
		{ map = "10,-13", path = "top"},
		{ map = "9,-13", path = "top"},
		{ map = "8,-13", path = "top"},
		{ map = "7,-13", path = "top"},
		{ map = "6,-13", path = "top"},
		{ map = "5,-13", path = "top"},
		{ map = "4,-13", path = "top"},
		{ map = "3,-13", path = "top"},
		{ map = "2,-13", path = "top"},
		{ map = "1,-13", path = "top"},
		{ map = "0,-13", path = "top"},
		{ map = "-1,-13", path = "top"},
		{ map = "12,-22", path = "left"},
		{ map = "12,-23", path = "left"},
		{ map = "12,-24", path = "left"},
		{ map = "12,-25", path = "left"},
		{ map = "12,-26", path = "left"},
		{ map = "12,-27", path = "left"},
		{ map = "13,-27", path = "left"},
		{ map = "13,-28", path = "left"},
		{ map = "12,-28", path = "left"},
		{ map = "11,-28", path = "bottom"},
		{ map = "11,-27", path = "bottom"},
		{ map = "11,-26", path = "bottom"},
		{ map = "11,-25", path = "bottom"},
		{ map = "11,-24", path = "bottom"},
		{ map = "11,-23", path = "bottom"},
		{ map = "11,-22", path = "bottom"},
		{ map = "8,-28", path = "right"},
		{ map = "9,-28", path = "right"},
		{ map = "10,-28", path = "right"},
		{ map = "8,-27", path = "right"},
		{ map = "9,-27", path = "right"},
		{ map = "10,-27", path = "right"},
		{ map = "8,-26", path = "right"},
		{ map = "9,-26", path = "right"},
		{ map = "10,-26", path = "right"},
		{ map = "8,-25", path = "right"},
		{ map = "9,-25", path = "right"},
		{ map = "10,-25", path = "right"},
		{ map = "10,-24", path = "right"},
		{ map = "10,-23", path = "right"},
		{ map = "10,-22", path = "right"},
		{ map = "7,-28", path = "bottom"},
		{ map = "7,-27", path = "bottom"},
		{ map = "7,-26", path = "bottom"},
		{ map = "7,-25", path = "left"},
		{ map = "6,-25", path = "left"},
		{ map = "7,-24", path = "left"},
		{ map = "6,-24", path = "left"},
		{ map = "8,-24", path = "bottom"},
		{ map = "9,-24", path = "bottom"},
		{ map = "9,-23", path = "bottom"},
		{ map = "9,-22", path = "bottom"},
		{ map = "8,-22", path = "bottom"},
		{ map = "8,-23", path = "bottom"},
		{ map = "6,-23", path = "bottom"},
		{ map = "7,-23", path = "bottom"},
		{ map = "7,-22", path = "bottom"},
		{ map = "6,-22", path = "bottom"},
		{ map = "5,-23", path = "bottom"},
		{ map = "5,-22", path = "bottom"},
		{ map = "4,-23", path = "bottom"},
		{ map = "4,-22", path = "bottom"},
		{ map = "3,-23", path = "bottom"},
		{ map = "3,-22", path = "bottom"},
		{ map = "2,-23", path = "bottom"},
		{ map = "2,-22", path = "bottom"},
		{ map = "1,-23", path = "bottom"},
		{ map = "1,-22", path = "bottom"},
		{ map = "0,-23", path = "bottom"},
		{ map = "0,-22", path = "bottom"},
		{ map = "0,-21", path = "bottom"},
		{ map = "0,-20", path = "right"},
		{ map = "0,-19", path = "right"},
		{ map = "0,-18", path = "right"},
		{ map = "0,-17", path = "right"},
		{ map = "0,-16", path = "right"},
		{ map = "0,-15", path = "right"},
		{ map = "-1,-15", path = "right"},
		{ map = "-1,-16", path = "right"},
		{ map = "-2,-16", path = "right"},
		{ map = "-2,-15", path = "right"},
		{ map = "-2,-17", path = "right"},
		{ map = "-1,-17", path = "right"},
		{ map = "-1,-18", path = "right"},
		{ map = "-2,-18", path = "right"},
		{ map = "-2,-19", path = "right"},
		{ map = "-1,-19", path = "right"},
		{ map = "-1,-20", path = "right"},
		{ map = "-2,-20", path = "right"},
		{ map = "-2,-21", path = "right"},
		{ map = "-1,-21", path = "right"},
		{ map = "-1,-22", path = "right"},
		{ map = "-2,-22", path = "right"},
		{ map = "-3,-22", path = "right"},
		{ map = "-3,-24", path = "right"},
		{ map = "-3,-23", path = "right"},
		{ map = "-3,-26", path = "right"},
		{ map = "-3,-25", path = "right"},
		{ map = "-3,-27", path = "right"},
		{ map = "-2,-27", path = "right"},
		{ map = "-3,-28", path = "right"},
		{ map = "-2,-28", path = "right"},
		{ map = "-2,-26", path = "right"},
		{ map = "-2,-25", path = "right"},
		{ map = "-2,-24", path = "right"},
		{ map = "-2,-23", path = "right"},
		{ map = "-1,-23", path = "right"},
		{ map = "-1,-24", path = "right"},
		{ map = "0,-24", path = "right"},
		{ map = "1,-24", path = "right"},
		{ map = "2,-24", path = "right"},
		{ map = "3,-24", path = "right"},
		{ map = "4,-24", path = "bottom"},
		{ map = "5,-24", path = "bottom"},
		{ map = "-1,-25", path = "bottom"},
		{ map = "0,-25", path = "bottom"},
		{ map = "1,-25", path = "bottom"},
		{ map = "2,-25", path = "bottom"},
		{ map = "3,-25", path = "bottom"},
		{ map = "4,-25", path = "bottom"},
		{ map = "5,-25", path = "bottom"},
		{ map = "-1,-26", path = "bottom"},
		{ map = "0,-26", path = "bottom"},
		{ map = "2,-26", path = "bottom"},
		{ map = "1,-26", path = "bottom"},
		{ map = "3,-26", path = "bottom"},
		{ map = "4,-26", path = "bottom"},
		{ map = "5,-26", path = "bottom"},
		{ map = "6,-26", path = "bottom"},
		{ map = "6,-27", path = "bottom"},
		{ map = "5,-27", path = "bottom"},
		{ map = "4,-27", path = "bottom"},
		{ map = "3,-27", path = "bottom"},
		{ map = "2,-27", path = "bottom"},
		{ map = "1,-27", path = "bottom"},
		{ map = "0,-27", path = "bottom"},
		{ map = "-1,-27", path = "bottom"},
		{ map = "-1,-28", path = "bottom"},
		{ map = "0,-28", path = "bottom"},
		{ map = "1,-28", path = "bottom"},
		{ map = "2,-28", path = "bottom"},
		{ map = "3,-28", path = "bottom"},
		{ map = "4,-28", path = "bottom"},
		{ map = "5,-28", path = "bottom"},
		{ map = "6,-28", path = "bottom"},
		{ map = "-3,-29", path = "bottom"},
		{ map = "-3,-30", path = "bottom"},
		{ map = "-3,-31", path = "bottom"},
		{ map = "-3,-32", path = "bottom"},
		{ map = "-3,-33", path = "bottom"},
		{ map = "-3,-34", path = "bottom"},
		{ map = "-2,-34", path = "bottom"},
		{ map = "-2,-33", path = "left"},
		{ map = "-1,-34", path = "left"},
		{ map = "0,-34", path = "left"},
		{ map = "1,-34", path = "left"},
		{ map = "-2,-32", path = "bottom"},
		{ map = "-2,-31", path = "bottom"},
		{ map = "-2,-30", path = "bottom"},
		{ map = "-2,-29", path = "bottom"},
		{ map = "-1,-33", path = "bottom"},
		{ map = "-1,-32", path = "bottom"},
		{ map = "-1,-31", path = "bottom"},
		{ map = "0,-33", path = "bottom"},
		{ map = "0,-32", path = "bottom"},
		{ map = "1,-33", path = "bottom"},
		{ map = "1,-32", path = "bottom"},
		{ map = "2,-33", path = "bottom"},
		{ map = "2,-34", path = "bottom"},
		{ map = "2,-32", path = "right"},
		{ map = "3,-33", path = "bottom"},
		{ map = "3,-32", path = "bottom"},
		{ map = "3,-31", path = "bottom"},
		{ map = "2,-30", path = "right"},
		{ map = "3,-30", path = "bottom"},
		{ map = "3,-29", path = "bottom"},
		{ map = "2,-29", path = "bottom"},
		{ map = "4,-29", path = "bottom"},
		{ map = "4,-30", path = "bottom"},
		{ map = "4,-31", path = "bottom"},
		{ map = "4,-32", path = "bottom"},
		{ map = "5,-32", path = "bottom"},
		{ map = "5,-31", path = "bottom"},
		{ map = "5,-29", path = "bottom"},
		{ map = "5,-30", path = "bottom"},
		{ map = "6,-30", path = "bottom"},
		{ map = "6,-29", path = "bottom"},
		{ map = "7,-29", path = "bottom"},
		{ map = "6,-31", path = "bottom"},
		{ map = "6,-32", path = "bottom"},
		{ map = "4,-33", path = "bottom"},
		{ map = "5,-33", path = "bottom"},
		{ map = "6,-33", path = "bottom"},
		{ map = "6,-34", path = "bottom"},
		{ map = "5,-34", path = "bottom"},
		{ map = "4,-34", path = "bottom"},
		{ map = "3,-34", path = "right"},
		{ map = "3,-35", path = "right"},
		{ map = "4,-35", path = "bottom"},
		{ map = "2,-31", path = "left"},
		{ map = "1,-31", path = "left"},
		{ map = "1,-30", path = "left"},
		{ map = "0,-30", path = "left"},
		{ map = "-1,-30", path = "left"},
		{ map = "0,-31", path = "left"},
	}
end

return resetF
