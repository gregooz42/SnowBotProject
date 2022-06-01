local free_team = {}

ASTRUB_MONSTERS = {

	460, -- Frakacia Leukocytine
	463, -- Fouduglen l'Écureuil
	4266, -- Sam Sagaz

	236, -- Piou Violet
	489, -- Piou Rouge
	490, -- Piou Vert
	491, -- Piou Bleu
	492, -- Piou Rose
	493, -- Piou Jaune

	31, -- Larve Bleue
	34, -- Larve Verte
	46, -- Larve Orangeqq
	5225, -- Larve Jaune
	--MapComplementaryInformationsDataMessage

	36, -- Bouftou

	159, -- Milimilou
	103, -- Prespic
	104, -- Sanglier
	4823, -- Ecurouille

	52, -- Arakne
	59, -- Champ Champ
	61, -- Moskito

	-- Martoa sherpoa etc..
	--5228,
	--5229,
	--5230,
	--5231,

	48, -- Tournesol Sauvage
	78, -- Rose Démoniaque
	79, -- Pissenlit Diabolique
	482, -- Epouvanteur
}

function all()
	printF.debug("free_team.lua", "all()")

	if GROUP_LEVEL <= 40 then
		MIN_MONSTERS = 2
		MAX_MONSTERS = 3
	elseif GROUP_LEVEL < 100 then
		MIN_MONSTERS = 3
		MAX_MONSTERS = 6
	else
		MIN_MONSTERS = 4
		MAX_MONSTERS = 8
	end
	if map:currentSubArea() == "Forêt d'Astrub"
	or map:currentSubArea() == "Carrière d'Astrub"
	then
		if GROUP_LEVEL < 100 then
			if MAX_MONSTERS > 1 then
				MAX_MONSTERS = MAX_MONSTERS - 1
			end
			if MIN_MONSTERS > 1 then
				MIN_MONSTERS = MIN_MONSTERS - 1
			end
		end
	end
	if map:currentSubArea() == "Cité d'Astrub" then
		FORBIDDEN_MONSTERS = ASTRUB_MONSTERS
		printF.info("Le fight dans la zone : '" .. map:currentSubArea() .. "' est désactivé.")
	end
	actual_path = 1
	return astrub.piou()
end

function all_big()
	printF.debug("free_team.lua", "all_big()")

	MIN_MONSTERS = 4
	MAX_MONSTERS = 8

	return astrub.piou()
end

function free_team.main()
	printF.debug("free_team.lua", "main()")

	FORBIDDEN_MONSTERS = {
		460, -- Frakacia Leukocytine
		463, -- Fouduglen l'Écureuil
		4266, -- Sam Sagaz
	}

	MIN_MONSTERS = 1
	MAX_MONSTERS = 2

	if GROUP_LEVEL < 150 then
		return all()
	else
		return all_big()
	end
end

return free_team
