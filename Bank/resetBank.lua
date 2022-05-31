local resetBank =  {}

function resetBank.astrub()
	printF.debug("resetBank.lua", "astrub()")

	local astrubZapToBank = {
		{ map = "5,-18", path = "left"},
		{ map = "191104002", door = "288"}, -- 191104002 on rentre dans la banque
	}

    if toolF.isOnMapPath(astrubZapToBank) then
        return astrubZapToBank
	else
        printF.info("Go à la Banque d'Astrub !")
        return resetF.zapAstrub()
    end

end

return resetBank
