local itemF = {}

function itemF.isIdol(GID)
	printF.debug("itemF.lua", "isIdol()")

	local idols =  objectIdols.getIdols()

	for _, idol in ipairs(idols) do
		if GID == idol then
			return true
		end
	end
	return false
end

function itemF.isFami(GID)
	printF.debug("itemF.lua", "isFami()")

	local familliers = {
		6716, -- Nomoon
		6604, -- Kouin Kouin
		11011, -- Tifoux tigré
		7703, -- Vilain petit corbac
	}

	for _, fami in ipairs(familliers) do
		if GID == fami then
			return true
		end
	end
end

return itemF
