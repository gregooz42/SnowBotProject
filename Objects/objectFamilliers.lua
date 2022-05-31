local objectFamillers = {}

function objectFamillers.getFamilliers()
	printF.debug("objectFamillers.lua", "getFamilliers()")

	local familliers = {
		-- FAMILLIER 		== 8 --
		{ id = 1728, niv = 1, price = 15000, postion = 8, go_buy = false, not_onsell = false},		-- Chacha
		{ id = 6716, niv = 50, price = 200000, postion = 8, go_buy = false, not_onsell = false},	-- Nomoon
	}

	return familliers
end

return objectFamillers
