local objectGathers = {}

GATHER_ON = true

function objectGathers.getGathers()
	printF.debug("objectGathers.lua", "getGathers()")

	local gathers = {}
	local gathersJob = {{}}

	if not GATHER_ON then
        gathers_final = {0}
		return gathers_final
    end

	gathersJob[1] = getGathersAlchi()
	gathersJob[2] = getGathersBucheron()
	gathersJob[3] = getGathersPaysan()
	gathersJob[4] = getGathersPecheur()

	for i = 1, 4 do
		for _, job in ipairs(gathersJob[i]) do
			table.insert(gathers, job)
		end
	end
	return gathers
end

function getGathersAlchi()
	printF.debug("objectGathers.lua", "getGathersAlchi()")

	local gathersAlchi = {}

	if job:level(26) < 20 then
		gathersAlchi = {
					254, -- Ortie
					66, -- Menthe
					255, -- Sauge
					67 -- Trèfle
		}
	elseif job:level(26) < 40 then
		gathersAlchi = {
			254, -- Ortie
			66, -- Menthe
			255, -- Sauge
			67 -- Trèfle
		}
	elseif job:level(26) < 60 then
		gathersAlchi = {
			254, -- Ortie
			66, -- Menthe
			255, -- Sauge
			67 -- Trèfle
		}
	elseif job:level(26) < 80 then
		gathersAlchi = {
			254, -- Ortie
			66, -- Menthe Sauvage
			255, -- Sauge
			67, -- Trèfle à 5 feuilles
			68 -- 80 Orchidée Freyesque
		}
	else
		gathersAlchi = {
			254, -- Ortie
			66, -- Menthe
			255, -- Sauge
			67 -- Trèfle
		}
	end
	return gathersAlchi
end

function getGathersPecheur()
	printF.debug("objectGathers.lua", "getGathersPecheur()")

	local gathersPecheur = {}

	if job:level(36) < 20 then
		gathersPecheur = {
			77, -- Crabe
			75, -- Goujon
			71, -- Greuvette
			76, -- Poisson-chaton
			74 -- Truite
		}
	elseif job:level(36) < 40 then
		gathersPecheur = {
			77, -- Crabe
			75, -- Goujon
			71, -- Greuvette
			76, -- Poisson-chaton
			74 -- Truite
		}
	elseif job:level(36) < 60 then
		gathersPecheur = {
			77, -- Crabe
			75, -- Goujon
			71, -- Greuvette
			76, -- Poisson-chaton
			74, -- Truite
			79, -- Carpe d'Iem
			78 -- Poisson Pané

		}
	elseif job:level(36) < 80 then
		gathersPecheur = {
			77, -- Crabe
			75, -- Goujon
			71, -- Greuvette
			76, -- Poisson-chaton
			74, -- Truite
			79, -- Carpe d'Iem
			78 -- Poisson Pané
		}
	else
		gathersPecheur = {
			77, -- Crabe
			75, -- Goujon
			71, -- Greuvette
			76, -- Poisson-chaton
			74, -- Truite
			79, -- Carpe d'Iem
			78 -- Poisson Pané
		}
	end
	return gathersPecheur
end

function getGathersBucheron()
	printF.debug("objectGathers.lua", "getGathersBucheron()")

	local gathersBucheron = {}

	if job:level(2) < 20 then
		gathersBucheron = {
			1, -- Frene
			33, -- Chataigner
			8, -- Chene
			34 -- Noyer
		}
	elseif job:level(2) < 40 then
		gathersBucheron = {
			1, -- Frene
			33, -- Chataigner
			8, -- Chene
			34 -- Noyer
		}
	elseif job:level(2) < 60 then
		gathersBucheron = {
			1, -- Frene
			33, -- Chataigner
			8, -- Chene
			34 -- Noyer
		}
	elseif job:level(2) < 80 then
		gathersBucheron = {
			1, -- Frene
			33, -- Chataigner
			8, -- Chene
			34 -- Noyer
		}
	else
		gathersBucheron = {
			1, -- Frene
			33, -- Chataigner
			8, -- Chene
			34 -- Noyer
		}
	end
	return gathersBucheron
end

function getGathersPaysan()
	printF.debug("objectGathers.lua", "getGathersPaysan()")

	local gathersPaysan = {}

	if job:level(28) < 20 then
		gathersPaysan = {
			38, -- Blé
			43 -- Orge
		}
	elseif job:level(28) < 40 then
		gathersPaysan = {
			38, -- Blé
			43 -- Orge
		}
	elseif job:level(28) < 60 then
		gathersPaysan = {
			38, -- Blé
			43 -- Orge
		}
	elseif job:level(28) < 80 then
		gathersPaysan = {
			38, -- Blé
			43 -- Orge
		}
	else
		gathersPaysan = {
			38, -- Blé
			43 -- Orge
		}
	end
	return gathersPaysan
end

return objectGathers
