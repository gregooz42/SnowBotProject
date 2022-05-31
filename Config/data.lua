local data = {}

function data.getLogs()
	printF.debug("data.lua", "getLogs()")

	local logs = {
		{alias = "Pandore - BANK", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Pandore - HDV", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Pandore - LEAD", user = "email@gmail.com", pass = "Motdepasse", autoC = true},

		{alias = "Agride - BANK", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Agride - HDV", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Agride - LEAD", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Agride - Panda", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Agride - Eni", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Agride - Feca", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Agride - Sacri", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Agride - Sadi", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Agride - Enu", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Agride - Iop", user = "email@gmail.com", pass = "Motdepasse", autoC = true},

		{alias = "Meriana - BANK", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Meriana - HDV", user = "email@gmail.com", pass = "Motdepasse", autoC = true},

		{alias = "Furye - BANK", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Furye - HDV", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Furye - LEAD", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Furye - Panda", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Furye - Feca", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Furye - Eni", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Furye - Sadi", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Furye - Enu", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Furye - Iop", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
		{alias = "Furye - Sacri", user = "email@gmail.com", pass = "Motdepasse", autoC = true},
	}
	return logs
end

function data.getIdBANK(serv)
	printF.debugM("data.lua", "getIdBANK()")

	if serv == nil then
		serv = character:server()
	end
	local id = 0

	if serv == "Meriana" then id = 0 --908983699307
	elseif serv == "Pandore" then id = 0
	elseif serv == "Agride" then id = 0
	elseif serv == "Nidas" then id = 0
	elseif serv == "Furye" then id = 353249643187
	elseif serv == "Merkator" then id = 0 --316445862130

	else id = 0 end
	return id
end

function data.getIdHDV(serv)
	printF.debugM("data.lua", "getIdHDV()")

	if serv == nil then
		serv = character:server()
	end
	local id = 0

	if serv == "Meriana" then id = 0
	elseif serv == "Pandore" then id = 0
	elseif serv == "Agride" then id = 662920379356
	elseif serv == "Nidas" then id = 0
	elseif serv == "Furye" then id = 344242805939
	elseif serv == "Merkator" then id = 0

	else id = 0 end
	return id
end

function data.getIdTEAMLeader(serv)
	printF.debug("data.lua", "getIdTEAMLeader()")

	if serv == nil then
		serv = character:server()
	end

	local id = 0
	if serv == "Meriana" then id = 0
	elseif serv == "Pandore" then id = 0
	elseif serv == "Agride" then id = 663224574344
	elseif serv == "Nidas" then id = 0
	elseif serv == "Furye" then id = 351421189819
	elseif serv == "Merkator" then id = 0

	else id = 0 end
	return id
end

return data
