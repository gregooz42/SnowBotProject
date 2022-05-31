local kamasF = {}

ABO_PRICE = 1000000

function kamasF.getSecure(level)
	printF.debug("kamasF.lua", "getSecure()")

	if level == nil then
		level = character:level()
	end
	if level < 20 then
		return 200
	elseif level < 30 then
		return 500
	elseif level < 50 then
		return 2000
	elseif level < 80 then
		return 20000
	else
		return ABO_PRICE-- Pour l'abonnement
	end
end

function kamasF.getSecureBank(level)
	printF.debug("kamasF.lua", "getSecureBank()")

	if level == nil then
		level = character:level()
	end
	if character:level() < 40 then
		return 100000
	elseif character:level() < 50 then
		return 200000
	else
		return 300000
	end
end

return kamasF
