local objectStuff = {}

function objectStuff.getStuff(class)
	printF.debug("objectStuff.lua", "getStuff()")

local stuffFeca = {
	-- AMULETTE 		== 0 --
	{ id = 8213, niv = 11, price = 1000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette du Piou Rouge
	{ id = 2425, niv = 20, price = 10000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Bouf
	{ id = 2443, niv = 28, price = 50000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Royale du Bouftou
	{ id = 9149, niv = 50, price = 50000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop Griotte
	{ id = 9153, niv = 80, price = 200000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop Griotte royal
	-- ARME				== 1 --
	{ id = 16527, niv = 8, price = 1000, postion = 1, go_buy = false, not_onsell = false}, -- Marteau de Hargnok
	{ id = 2416, niv = 20, price = 15000, postion = 1, go_buy = false, not_onsell = false}, -- Marteau du Bouftou
	{ id = 2440, niv = 30, price = 30000, postion = 1, go_buy = false, not_onsell = false}, -- Epée Royale du Bouftou
	{ id = 2440, niv = 55, price = 100000, postion = 1, go_buy = false, not_onsell = false}, -- Baguette d'Houvette
	{ id = 180, niv = 105, price = 500000, postion = 1, go_buy = false, not_onsell = false}, -- La Baguette des Limbes

	-- ANNEAU (gauche) 	== 2 --
	{ id = 8221, niv = 8, price = 1000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Piou Violet
	{ id = 2441, niv = 31, price = 30000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Royal du Bouftout
	{ id = 2469, niv = 60, price = 250000, postion = 2, go_buy = false, not_onsell = false},  -- Gelano
	-- CEINTURE 		== 3
	{ id = 8237, niv = 7, price = 1000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture du Piou Rouge
	{ id = 2428, niv = 20, price = 10000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture Bouf
	{ id = 2444, niv = 30, price = 30000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture Bouf Royal
	{ id = 9167, niv = 50, price = 50000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture Griottes
	{ id = 9171, niv = 80, price = 200000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture Griottes royal
	-- ANNEAU (droite) 	== 4 --
	{ id = 8219, niv = 10, price = 1000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau du Piou Rouge
	{ id = 2419, niv = 20, price = 10000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau Bouf
	{ id = 9122, niv = 50, price = 50000, postion = 4, go_buy = false, not_onsell = false}, -- Blopanneau Griottes
	{ id = 9126, niv = 80, price = 200000, postion = 4, go_buy = false, not_onsell = false}, -- Blopanneau Griottes royal
	-- BOTTES 			== 5 --
	{ id = 8225, niv = 9, price = 1000, postion = 5, go_buy = false, not_onsell = false}, -- Sandales du Piou Rouge
	{ id = 2422, niv = 20, price = 10000, postion = 5, go_buy = false, not_onsell = false}, -- Boufbottes
	{ id = 2442, niv = 30, price = 50000, postion = 5, go_buy = false, not_onsell = false}, -- Boufbottes Royales
	{ id = 9158, niv = 50, price = 50000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes Griottes
	{ id = 9162, niv = 80, price = 200000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes Griottes royal
	-- CHAPEAU 			== 6 --
	{ id = 8243, niv = 12, price = 1000, postion = 6, go_buy = false, not_onsell = false}, -- Chapeau du Piou Rouge
	{ id = 2411, niv = 20, price = 10000, postion = 6, go_buy = false, not_onsell = false}, -- Coiffe Bouf
	{ id = 2096, niv = 37, price = 30000, postion = 6, go_buy = false, not_onsell = false}, -- Dora Sombre de Brave
	{ id = 2531, niv = 60, price = 200000, postion = 6, go_buy = false, not_onsell = false}, -- Caracoiffe

	-- CAPE 			== 7 --
	{ id = 8231, niv = 8, price = 1000, postion = 7, go_buy = false, not_onsell = false}, -- Cape du Piou Rouge
	{ id = 2414, niv = 20, price = 10000, postion = 7, go_buy = false, not_onsell = false}, -- Cape Bouffante
	{ id = 2445, niv = 29, price = 20000, postion = 7, go_buy = false, not_onsell = false}, -- Cape Bouffante Royal
	{ id = 6927, niv = 37, price = 30000, postion = 7, go_buy = false, not_onsell = false}, -- Cape du Prespic
	{ id = 6994, niv = 56, price = 150000, postion = 7, go_buy = false, not_onsell = false}, -- - Cape Hôte

	-- TROPH 1 = 9
	{ id = 12727, niv = 50, price = 100000, postion = 9, go_buy = false, not_onsell = false}, -- Survivant mineur
	-- TROPH 2 = 10
	{ id = 12718, niv = 50, price = 100000, postion = 10, go_buy = false, not_onsell = false}, -- Savant mineur
	-- TROPH 3 = 11
	{ id = 12694, niv = 50, price = 100000, postion = 11, go_buy = false, not_onsell = false}, -- Ravageur Feu mineur
	-- TROPH 4 = 12
	{ id = 13760, niv = 50, price = 100000, postion = 12, go_buy = false, not_onsell = false}, -- Astucieux mineur
	-- TROPH 5 = 13
	{ id = 13823, niv = 50, price = 100000, postion = 13, go_buy = false, not_onsell = false}, -- Puissant mineur
	-- TROPH 6 = 14
	{ id = 13778, niv = 50, price = 100000, postion = 14, go_buy = false, not_onsell = false}, -- Saccageur Feu mineur

	-- BOUCLIER 		== 15 --
	{ id = 18714, niv = 5, price = 2000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier du tournesol sauvage
	{ id = 18666, niv = 20, price = 10000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier Bouf
	{ id = 18659, niv = 25, price = 50000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier en Mousse
	{ id = 18682, niv = 45, price = 100000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier Abraknyde
}

local stuffEnu = {
	-- AMULETTE 		== 0 --
	{ id = 8214, niv = 10, price = 1000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette du Piou Bleu
	{ id = 8123, niv = 20, price = 10000, postion = 0, go_buy = false, not_onsell = false}, --  Amulette Paysanne
	{ id = 7250, niv = 41, price = 40000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Akwadala
	{ id = 9152, niv = 50, price = 50000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop Indigo
	{ id = 9156, niv = 80, price = 200000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop Indigo royal
	-- ARME				== 1 --
	{ id = 16527, niv = 8, price = 1000, postion = 1, go_buy = false, not_onsell = false}, -- Marteau de Hargnok
	{ id = 331, niv = 22, price = 15000, postion = 1, go_buy = false, not_onsell = false}, -- Arc Hancihaile
	{ id = 7254, niv = 43, price = 60000, postion = 1, go_buy = false, not_onsell = false}, -- Bâton Akwadala
	{ id = 250, niv = 72, price = 300000, postion = 1, go_buy = false, not_onsell = false}, -- Ares
	{ id = 180, niv = 105, price = 500000, postion = 1, go_buy = false, not_onsell = false}, -- La Baguette des Limbes

	-- ANNEAU (gauche) 	== 2 --
	{ id = 8221, niv = 8, price = 1000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Piou Violet
	{ id = 2419, niv = 20, price = 10000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Bouf
	{ id = 7246, niv = 37, price = 50000, postion = 2, go_buy = false, not_onsell = false}, -- Alliance Akwadala
	{ id = 2469, niv = 60, price = 250000, postion = 2, go_buy = false, not_onsell = false},  -- Gelano
	-- CEINTURE 		== 3
	{ id = 8238, niv = 9, price = 1000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture du Piou Bleu
	{ id = 8124, niv = 20, price = 10000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinturemuda du Paysan
	{ id = 7238, niv = 41, price = 50000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture Akwadala
	{ id = 9170, niv = 50, price = 50000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture Indigo
	{ id = 9174, niv = 80, price = 200000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture Indigo royal
	-- ANNEAU (droite) 	== 4 --
	{ id = 8220, niv = 9, price = 1000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau du Piou Bleu
	{ id = 8126, niv = 12, price = 5000, postion = 4, go_buy = false, not_onsell = false}, -- Mitaines Mitées du Paysan
	{ id = 2441, niv = 31, price = 30000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau Royal du Bouftou
	{ id = 9125, niv = 50, price = 50000, postion = 4, go_buy = false, not_onsell = false}, -- Blopanneau Indigo
	{ id = 9129, niv = 80, price = 200000, postion = 4, go_buy = false, not_onsell = false}, -- Blopanneau Indigo royal
	-- BOTTES 			== 5 --
	{ id = 8226, niv = 8, price = 1000, postion = 5, go_buy = false, not_onsell = false}, -- Sandales du Piou Bleu
	{ id = 8128, niv = 19, price = 10000, postion = 5, go_buy = false, not_onsell = false}, -- Bottes Paysannes
	{ id = 7242, niv = 35, price = 50000, postion = 5, go_buy = false, not_onsell = false}, -- Geta Akwadala
	{ id = 9161, niv = 50, price = 50000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes Indigo
	{ id = 9165, niv = 80, price = 200000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes Indigo royal
	-- CHAPEAU 			== 6 --
	{ id = 8244, niv = 11, price = 1000, postion = 6, go_buy = false, not_onsell = false}, -- Chapeau du Piou Bleu
	{ id = 8125, niv = 19, price = 10000, postion = 6, go_buy = false, not_onsell = false}, -- Bob du Paysan
	{ id = 7226, niv = 43, price = 50000, postion = 6, go_buy = false, not_onsell = false}, -- Chapeau Akwadala
	{ id = 2531, niv = 60, price = 200000, postion = 6, go_buy = false, not_onsell = false}, -- Caracoiffe
	-- CAPE 			== 7 --
	{ id = 8232, niv = 7, price = 1000, postion = 7, go_buy = false, not_onsell = false}, -- Cape du Piou Bleu
	{ id = 8131, niv = 18, price = 10000, postion = 7, go_buy = false, not_onsell = false}, -- Sac du Paysan
	{ id = 7230, niv = 41, price = 50000, postion = 7, go_buy = false, not_onsell = false}, -- Cape Akwadala
	{ id = 17109, niv = 92, price = 180000, postion = 7, go_buy = false, not_onsell = false}, -- Cape du Capitaine Pirate
	{ id = 8464, niv = 112, price = 400000, postion = 7, go_buy = false, not_onsell = false}, -- Abracapa Ancestrale
	{ id = 11580, niv = 144, price = 500000, postion = 7, go_buy = false, not_onsell = false}, -- Cape du Mansot Royal

	-- TROPH 1 = 9
	{ id = 12727, niv = 50, price = 100000, postion = 9, go_buy = false, not_onsell = false}, -- Survivant mineur
	-- TROPH 2 = 10
	{ id = 13766, niv = 50, price = 100000, postion = 10, go_buy = false, not_onsell = false}, -- Taquin mineur
	-- TROPH 3 = 11
	{ id = 12691, niv = 50, price = 100000, postion = 11, go_buy = false, not_onsell = false}, -- Ravageur Eau mineur
	-- TROPH 4 = 12
	{ id = 12717, niv = 50, price = 100000, postion = 12, go_buy = false, not_onsell = false}, -- Joueur mineur
	-- TROPH 5 = 13
	{ id = 13823, niv = 50, price = 100000, postion = 13, go_buy = false, not_onsell = false}, -- Puissant mineur
	-- TROPH 6 = 14
	{ id = 13781, niv = 50, price = 100000, postion = 14, go_buy = false, not_onsell = false}, -- Saccageur Eau mineur

	-- BOUCLIER 		== 15 --
	{ id = 18714, niv = 5, price = 2000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier du tournesol sauvage
	{ id = 18666, niv = 20, price = 10000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier Bouf
	{ id = 18659, niv = 25, price = 50000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier en Mousse
	{ id = 18682, niv = 45, price = 100000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier Abraknyde
}

local stuffEni = {
	-- AMULETTE 		== 0 --
	{ id = 8213, niv = 11, price = 1000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette du Piou Rouge
	{ id = 2425, niv = 20, price = 10000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Bouf
	{ id = 2443, niv = 28, price = 50000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Royale du Bouftou
	{ id = 9149, niv = 50, price = 50000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop Griotte
	{ id = 9153, niv = 80, price = 200000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop Griotte royal
	-- ARME				== 1 --
	{ id = 16527, niv = 8, price = 1000, postion = 1, go_buy = false, not_onsell = false}, -- Marteau de Hargnok
	{ id = 2416, niv = 20, price = 15000, postion = 1, go_buy = false, not_onsell = false}, -- Marteau du Bouftou
	{ id = 2440, niv = 30, price = 30000, postion = 1, go_buy = false, not_onsell = false}, -- Epée Royale du Bouftou
	{ id = 2440, niv = 55, price = 100000, postion = 1, go_buy = false, not_onsell = false}, -- Baguette d'Houvette
	{ id = 180, niv = 105, price = 500000, postion = 1, go_buy = false, not_onsell = false}, -- La Baguette des Limbes

	-- ANNEAU (gauche) 	== 2 --
	{ id = 8221, niv = 8, price = 1000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Piou Violet
	{ id = 2441, niv = 31, price = 30000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Royal du Bouftout
	{ id = 2469, niv = 60, price = 250000, postion = 2, go_buy = false, not_onsell = false},  -- Gelano
	-- CEINTURE 		== 3
	{ id = 8237, niv = 7, price = 1000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture du Piou Rouge
	{ id = 2428, niv = 20, price = 10000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture Bouf
	{ id = 2444, niv = 30, price = 30000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture Bouf Royal
	{ id = 9167, niv = 50, price = 50000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture Griottes
	{ id = 9171, niv = 80, price = 200000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture Griottes royal
	-- ANNEAU (droite) 	== 4 --
	{ id = 8219, niv = 10, price = 1000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau du Piou Rouge
	{ id = 2419, niv = 20, price = 10000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau Bouf
	{ id = 9122, niv = 50, price = 50000, postion = 4, go_buy = false, not_onsell = false}, -- Blopanneau Griottes
	{ id = 9126, niv = 80, price = 200000, postion = 4, go_buy = false, not_onsell = false}, -- Blopanneau Griottes royal
	-- BOTTES 			== 5 --
	{ id = 8225, niv = 9, price = 1000, postion = 5, go_buy = false, not_onsell = false}, -- Sandales du Piou Rouge
	{ id = 2422, niv = 20, price = 10000, postion = 5, go_buy = false, not_onsell = false}, -- Boufbottes
	{ id = 2442, niv = 30, price = 50000, postion = 5, go_buy = false, not_onsell = false}, -- Boufbottes Royales
	{ id = 9158, niv = 50, price = 50000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes Griottes
	{ id = 9162, niv = 80, price = 200000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes Griottes royal
	-- CHAPEAU 			== 6 --
	{ id = 8243, niv = 12, price = 1000, postion = 6, go_buy = false, not_onsell = false}, -- Chapeau du Piou Rouge
	{ id = 2411, niv = 20, price = 10000, postion = 6, go_buy = false, not_onsell = false}, -- Coiffe Bouf
	{ id = 2096, niv = 37, price = 30000, postion = 6, go_buy = false, not_onsell = false}, -- Dora Sombre de Brave
	{ id = 2531, niv = 60, price = 200000, postion = 6, go_buy = false, not_onsell = false}, -- Caracoiffe
	-- CAPE 			== 7 --
	{ id = 8231, niv = 8, price = 1000, postion = 7, go_buy = false, not_onsell = false}, -- Cape du Piou Rouge
	{ id = 2414, niv = 20, price = 10000, postion = 7, go_buy = false, not_onsell = false}, -- Cape Bouffante
	{ id = 2445, niv = 29, price = 20000, postion = 7, go_buy = false, not_onsell = false}, -- Cape Bouffante Royal
	{ id = 6927, niv = 37, price = 30000, postion = 7, go_buy = false, not_onsell = false}, -- Cape du Prespic
	{ id = 6994, niv = 56, price = 150000, postion = 7, go_buy = false, not_onsell = false}, -- - Cape Hôte

	-- TROPH 1 = 9
	{ id = 12727, niv = 50, price = 100000, postion = 9, go_buy = false, not_onsell = false}, -- Survivant mineur
	-- TROPH 2 = 10
	{ id = 12718, niv = 50, price = 100000, postion = 10, go_buy = false, not_onsell = false}, -- Savant mineur
	-- TROPH 3 = 11
	{ id = 12707, niv = 50, price = 100000, postion = 11, go_buy = false, not_onsell = false}, -- Soigneur mineur
	-- TROPH 4 = 12
	{ id = 13760, niv = 50, price = 100000, postion = 12, go_buy = false, not_onsell = false}, -- Astucieux mineur
	-- TROPH 5 = 13
	{ id = 13823, niv = 50, price = 100000, postion = 13, go_buy = false, not_onsell = false}, -- Puissant mineur
	-- TROPH 6 = 14
	{ id = 13754, niv = 50, price = 100000, postion = 14, go_buy = false, not_onsell = false},  -- Docteur mineur

	-- BOUCLIER 		== 15 --
	{ id = 18714, niv = 5, price = 2000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier du tournesol sauvage
	{ id = 18666, niv = 20, price = 10000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier Bouf
	{ id = 18659, niv = 25, price = 50000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier en Mousse
	{ id = 18682, niv = 45, price = 100000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier Abraknyde
	{ id = 18671, niv = 65, price = 150000, postion = 15, go_buy = false, not_onsell = false}, -- Derma Tho
}

local stuffIop = {
	-- AMULETTE 		== 0 --
	{ id = 8214, niv = 10, price = 1000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette du Piou Bleu
	{ id = 8123, niv = 20, price = 10000, postion = 0, go_buy = false, not_onsell = false}, --  Amulette Paysanne
	{ id = 7250, niv = 41, price = 40000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Akwadala
	{ id = 9152, niv = 50, price = 50000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop Indigo
	{ id = 9156, niv = 80, price = 200000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop Indigo royal
	-- ARME				== 1 --
	{ id = 16527, niv = 8, price = 1000, postion = 1, go_buy = false, not_onsell = false}, -- Marteau de Hargnok
	{ id = 331, niv = 22, price = 15000, postion = 1, go_buy = false, not_onsell = false}, -- Arc Hancihaile
	{ id = 7254, niv = 43, price = 60000, postion = 1, go_buy = false, not_onsell = false}, -- Bâton Akwadala
	{ id = 250, niv = 72, price = 300000, postion = 1, go_buy = false, not_onsell = false}, -- Ares
	{ id = 180, niv = 105, price = 500000, postion = 1, go_buy = false, not_onsell = false}, -- La Baguette des Limbes

	-- ANNEAU (gauche) 	== 2 --
	{ id = 8221, niv = 8, price = 1000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Piou Violet
	{ id = 2419, niv = 20, price = 10000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Bouf
	{ id = 7246, niv = 37, price = 50000, postion = 2, go_buy = false, not_onsell = false}, -- Alliance Akwadala
	{ id = 2469, niv = 60, price = 250000, postion = 2, go_buy = false, not_onsell = false},  -- Gelano
	-- CEINTURE 		== 3
	{ id = 8238, niv = 9, price = 1000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture du Piou Bleu
	{ id = 8124, niv = 20, price = 10000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinturemuda du Paysan
	{ id = 7238, niv = 41, price = 50000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture Akwadala
	{ id = 9170, niv = 50, price = 50000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture Indigo
	{ id = 9174, niv = 80, price = 200000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture Indigo royal
	-- ANNEAU (droite) 	== 4 --
	{ id = 8220, niv = 9, price = 1000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau du Piou Bleu
	{ id = 8126, niv = 12, price = 5000, postion = 4, go_buy = false, not_onsell = false}, -- Mitaines Mitées du Paysan
	{ id = 2441, niv = 31, price = 30000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau Royal du Bouftou
	{ id = 9125, niv = 50, price = 50000, postion = 4, go_buy = false, not_onsell = false}, -- Blopanneau Indigo
	{ id = 9129, niv = 80, price = 200000, postion = 4, go_buy = false, not_onsell = false}, -- Blopanneau Indigo royal
	-- BOTTES 			== 5 --
	{ id = 8226, niv = 8, price = 1000, postion = 5, go_buy = false, not_onsell = false}, -- Sandales du Piou Bleu
	{ id = 8128, niv = 19, price = 10000, postion = 5, go_buy = false, not_onsell = false}, -- Bottes Paysannes
	{ id = 7242, niv = 35, price = 50000, postion = 5, go_buy = false, not_onsell = false}, -- Geta Akwadala
	{ id = 9161, niv = 50, price = 50000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes Indigo
	{ id = 9165, niv = 80, price = 200000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes Indigo royal
	-- CHAPEAU 			== 6 --
	{ id = 8244, niv = 11, price = 1000, postion = 6, go_buy = false, not_onsell = false}, -- Chapeau du Piou Bleu
	{ id = 8125, niv = 19, price = 10000, postion = 6, go_buy = false, not_onsell = false}, -- Bob du Paysan
	{ id = 7226, niv = 43, price = 50000, postion = 6, go_buy = false, not_onsell = false}, -- Chapeau Akwadala
	{ id = 2531, niv = 60, price = 200000, postion = 6, go_buy = false, not_onsell = false}, -- Caracoiffe
	-- CAPE 			== 7 --
	{ id = 8232, niv = 7, price = 1000, postion = 7, go_buy = false, not_onsell = false}, -- Cape du Piou Bleu
	{ id = 8131, niv = 18, price = 10000, postion = 7, go_buy = false, not_onsell = false}, -- Sac du Paysan
	{ id = 7230, niv = 41, price = 50000, postion = 7, go_buy = false, not_onsell = false}, -- Cape Akwadala
	{ id = 17109, niv = 92, price = 180000, postion = 7, go_buy = false, not_onsell = false}, -- Cape du Capitaine Pirate
	{ id = 8464, niv = 112, price = 400000, postion = 7, go_buy = false, not_onsell = false}, -- Abracapa Ancestrale
	{ id = 11580, niv = 144, price = 500000, postion = 7, go_buy = false, not_onsell = false}, -- Cape du Mansot Royal

	-- TROPH 1 = 9
	{ id = 12727, niv = 50, price = 100000, postion = 9, go_buy = false, not_onsell = false}, -- Survivant mineur
	-- TROPH 2 = 10
	{ id = 13766, niv = 50, price = 100000, postion = 10, go_buy = false, not_onsell = false}, -- Taquin mineur
	-- TROPH 3 = 11
	{ id = 12691, niv = 50, price = 100000, postion = 11, go_buy = false, not_onsell = false}, -- Ravageur Eau mineur
	-- TROPH 4 = 12
	{ id = 12717, niv = 50, price = 100000, postion = 12, go_buy = false, not_onsell = false}, -- Joueur mineur
	-- TROPH 5 = 13
	{ id = 13823, niv = 50, price = 100000, postion = 13, go_buy = false, not_onsell = false}, -- Puissant mineur
	-- TROPH 6 = 14
	{ id = 13781, niv = 50, price = 100000, postion = 14, go_buy = false, not_onsell = false}, -- Saccageur Eau mineur

	-- BOUCLIER 		== 15 --
	{ id = 18714, niv = 5, price = 2000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier du tournesol sauvage
	{ id = 18666, niv = 20, price = 10000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier Bouf
	{ id = 18659, niv = 25, price = 50000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier en Mousse
	{ id = 18682, niv = 45, price = 100000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier Abraknyde
}

local stuffCra = {
	-- AMULETTE 		== 0 --
	{ id = 8216, niv = 7, price = 1000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette du Piou Vert
	{ id = 783, niv = 20, price = 10000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette du Bûcheron
	{ id = 17488, niv = 40, price = 30000, postion = 0, go_buy = false, not_onsell = false}, -- Torque du Monarque
	{ id = 9151, niv = 50, price = 50000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop Coco
	{ id = 9155, niv = 80, price = 200000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop Coco royal
	-- ARME				== 1 --
	{ id = 16527, niv = 8, price = 1000, postion = 1, go_buy = false, not_onsell = false}, -- Marteau de Hargnok
	{ id = 67, niv = 22, price = 10000, postion = 1, go_buy = false, not_onsell = false}, -- Le Tranchant Infernal
	{ id = 2640, niv = 30, price = 30000, postion = 1, go_buy = false, not_onsell = false}, -- Baton carnivor
	{ id = 1054, niv = 53, price = 150000, postion = 1, go_buy = false, not_onsell = false}, -- Cruelle Pelle-Truelle
	{ id = 180, niv = 105, price = 500000, postion = 1, go_buy = false, not_onsell = false}, -- La Baguette des Limbes
	-- ANNEAU (gauche) 	== 2 --
	{ id = 8221, niv = 8, price = 1000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Piou Violet
	{ id = 2419, niv = 20, price = 10000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Bouf
	{ id = 10955, niv = 33, price = 30000, postion = 2, go_buy = false, not_onsell = false},  -- Anneau du Corbeau Noir
	{ id = 10633, niv = 44, price = 40000, postion = 2, go_buy = false, not_onsell = false},  -- Anneau de Gobeuf
	{ id = 2469, niv = 60, price = 250000, postion = 2, go_buy = false, not_onsell = false},  -- Gelano
	-- CEINTURE 		== 3
	{ id = 8240, niv = 9, price = 1000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture du Piou Vert
	{ id = 8257, niv = 20, price = 20000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture en Mousse
	{ id = 17506, niv = 38, price = 30000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture du Garde Royal
	{ id = 9169, niv = 50, price = 50000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture Coco
	{ id = 9173, niv = 80, price = 200000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture Coco royal
	-- ANNEAU (droite) 	== 4 --
	{ id = 8222, niv = 12, price = 1000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau du Piou Vert
	{ id = 2441, niv = 31, price = 30000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau Royal du Bouftou
	{ id = 9124, niv = 50, price = 50000, postion = 4, go_buy = false, not_onsell = false}, -- Blopanneau Coco
	{ id = 9128, niv = 80, price = 200000, postion = 4, go_buy = false, not_onsell = false}, -- Blopanneau Coco royal
	-- BOTTES 			== 5 --
	{ id = 8228, niv = 11, price = 1000, postion = 5, go_buy = false, not_onsell = false}, -- Sandales du Piou Vert
	{ id = 8256, niv = 20, price = 20000, postion = 5, go_buy = false, not_onsell = false}, -- Bottes en Mousse
	{ id = 6755, niv = 44, price = 60000, postion = 5, go_buy = false, not_onsell = false}, -- Kwakobottes de Vent
	{ id = 9160, niv = 50, price = 50000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes Coco
	{ id = 9164, niv = 80, price = 200000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes Coco royal
	-- CHAPEAU 			== 6 --
	{ id = 8246, niv = 8, price = 1000, postion = 6, go_buy = false, not_onsell = false}, -- Chapeau du Piou Vert
	{ id = 8125, niv = 19, price = 10000, postion = 6, go_buy = false, not_onsell = false}, -- Bob du Paysan
	{ id = 2641, niv = 30, price = 30000, postion = 6, go_buy = false, not_onsell = false}, -- Toady
	{ id = 2531, niv = 60, price = 200000, postion = 6, go_buy = false, not_onsell = false}, -- Caracoiffe
	-- CAPE 			== 7 --
	{ id = 8233, niv = 10, price = 1000, postion = 7, go_buy = false, not_onsell = false}, -- Cape du Piou Vert
	{ id = 953, niv = 36, price = 50000, postion = 7, go_buy = false, not_onsell = false}, -- Cape tofu fou

	-- TROPH 1 = 9
	{ id = 12727, niv = 50, price = 100000, postion = 9, go_buy = false, not_onsell = false}, -- Survivant mineur
	-- TROPH 2 = 10
	{ id = 12712, niv = 50, price = 100000, postion = 10, go_buy = false, not_onsell = false}, -- Acrobate mineur
	-- TROPH 3 = 11
	{ id = 12688, niv = 50, price = 100000, postion = 11, go_buy = false, not_onsell = false}, -- Ravageur Air mineur
	-- TROPH 4 = 12
	{ id = 13763, niv = 50, price = 100000, postion = 12, go_buy = false, not_onsell = false}, -- Equilibriste mineur
	-- TROPH 5 = 13
	{ id = 13823, niv = 50, price = 100000, postion = 13, go_buy = false, not_onsell = false}, -- Puissant mineur
	-- TROPH 6 = 14
	{ id = 13784, niv = 50, price = 100000, postion = 14, go_buy = false, not_onsell = false}, -- Saccageur Air mineur

	-- BOUCLIER 		== 15 --
	{ id = 18714, niv = 5, price = 2000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier du tournesol sauvage
	{ id = 18666, niv = 20, price = 10000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier Bouf
	{ id = 18659, niv = 25, price = 50000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier en Mousse
	{ id = 18710, niv = 35, price = 150000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier du chafer fantassin
}

local stuffSacri = {
	-- AMULETTE 		== 0 --
	{ id = 8216, niv = 7, price = 1000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette du Piou Vert
	{ id = 783, niv = 20, price = 10000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette du Bûcheron
	{ id = 17488, niv = 40, price = 30000, postion = 0, go_buy = false, not_onsell = false}, -- Torque du Monarque
	{ id = 9151, niv = 50, price = 50000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop Coco
	{ id = 9155, niv = 80, price = 200000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop Coco royal
	-- ARME				== 1 --
	{ id = 16527, niv = 8, price = 1000, postion = 1, go_buy = false, not_onsell = false}, -- Marteau de Hargnok
	{ id = 67, niv = 22, price = 10000, postion = 1, go_buy = false, not_onsell = false}, -- Le Tranchant Infernal
	{ id = 2640, niv = 30, price = 30000, postion = 1, go_buy = false, not_onsell = false}, -- Baton carnivor
	{ id = 1054, niv = 53, price = 150000, postion = 1, go_buy = false, not_onsell = false}, -- Cruelle Pelle-Truelle
	{ id = 180, niv = 105, price = 500000, postion = 1, go_buy = false, not_onsell = false}, -- La Baguette des Limbes
	-- ANNEAU (gauche) 	== 2 --
	{ id = 8221, niv = 8, price = 1000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Piou Violet
	{ id = 2419, niv = 20, price = 10000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Bouf
	{ id = 10955, niv = 33, price = 30000, postion = 2, go_buy = false, not_onsell = false},  -- Anneau du Corbeau Noir
	{ id = 10633, niv = 44, price = 40000, postion = 2, go_buy = false, not_onsell = false},  -- Anneau de Gobeuf
	{ id = 2469, niv = 60, price = 250000, postion = 2, go_buy = false, not_onsell = false},  -- Gelano
	-- CEINTURE 		== 3
	{ id = 8240, niv = 9, price = 1000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture du Piou Vert
	{ id = 8257, niv = 20, price = 20000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture en Mousse
	{ id = 17506, niv = 38, price = 30000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture du Garde Royal
	{ id = 9169, niv = 50, price = 50000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture Coco
	{ id = 9173, niv = 80, price = 200000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture Coco royal
	-- ANNEAU (droite) 	== 4 --
	{ id = 8222, niv = 12, price = 1000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau du Piou Vert
	{ id = 2441, niv = 31, price = 30000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau Royal du Bouftou
	{ id = 9124, niv = 50, price = 50000, postion = 4, go_buy = false, not_onsell = false}, -- Blopanneau Coco
	{ id = 9128, niv = 80, price = 200000, postion = 4, go_buy = false, not_onsell = false}, -- Blopanneau Coco royal
	-- BOTTES 			== 5 --
	{ id = 8228, niv = 11, price = 1000, postion = 5, go_buy = false, not_onsell = false}, -- Sandales du Piou Vert
	{ id = 8256, niv = 20, price = 20000, postion = 5, go_buy = false, not_onsell = false}, -- Bottes en Mousse
	{ id = 6755, niv = 44, price = 60000, postion = 5, go_buy = false, not_onsell = false}, -- Kwakobottes de Vent
	{ id = 9160, niv = 50, price = 50000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes Coco
	{ id = 9164, niv = 80, price = 200000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes Coco royal
	-- CHAPEAU 			== 6 --
	{ id = 8246, niv = 8, price = 1000, postion = 6, go_buy = false, not_onsell = false}, -- Chapeau du Piou Vert
	{ id = 8125, niv = 19, price = 10000, postion = 6, go_buy = false, not_onsell = false}, -- Bob du Paysan
	{ id = 2641, niv = 30, price = 30000, postion = 6, go_buy = false, not_onsell = false}, -- Toady
	{ id = 2531, niv = 60, price = 200000, postion = 6, go_buy = false, not_onsell = false}, -- Caracoiffe
	-- CAPE 			== 7 --
	{ id = 8233, niv = 10, price = 1000, postion = 7, go_buy = false, not_onsell = false}, -- Cape du Piou Vert
	{ id = 953, niv = 36, price = 50000, postion = 7, go_buy = false, not_onsell = false}, -- Cape tofu fou

	-- TROPH 1 = 9
	{ id = 12727, niv = 50, price = 100000, postion = 9, go_buy = false, not_onsell = false}, -- Survivant mineur
	-- TROPH 2 = 10
	{ id = 12712, niv = 50, price = 100000, postion = 10, go_buy = false, not_onsell = false}, -- Acrobate mineur
	-- TROPH 3 = 11
	{ id = 12688, niv = 50, price = 100000, postion = 11, go_buy = false, not_onsell = false}, -- Ravageur Air mineur
	-- TROPH 4 = 12
	{ id = 13763, niv = 50, price = 100000, postion = 12, go_buy = false, not_onsell = false}, -- Equilibriste mineur
	-- TROPH 5 = 13
	{ id = 13823, niv = 50, price = 100000, postion = 13, go_buy = false, not_onsell = false}, -- Puissant mineur
	-- TROPH 6 = 14
	{ id = 13748, niv = 50, price = 100000, postion = 14, go_buy = false, not_onsell = false}, -- Bloqueur mineur

	-- BOUCLIER 		== 15 --
	{ id = 18714, niv = 5, price = 2000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier du tournesol sauvage
	{ id = 18666, niv = 20, price = 10000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier Bouf
	{ id = 18659, niv = 25, price = 50000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier en Mousse
	{ id = 18710, niv = 35, price = 150000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier du chafer fantassin

}

local stuffSadi = {
	-- AMULETTE 		== 0 --
	{ id = 8217, niv = 12, price = 1000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette du Piou Jaune
	{ id = 2425, niv = 20, price = 10000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Bouf
	{ id = 2443, niv = 28, price = 50000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Royale du Bouftou
	{ id = 9150, niv = 50, price = 50000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop terre
	{ id = 9154, niv = 80, price = 200000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop terre Royal
	-- ARME				== 1 --
	{ id = 16527, niv = 8, price = 10000, postion = 1, go_buy = false, not_onsell = false}, -- Marteau de Hargnok
	{ id = 2416, niv = 20, price = 10000, postion = 1, go_buy = false, not_onsell = false}, -- Marteau Bouf
	{ id = 66, niv = 33, price = 30000, postion = 1, go_buy = false, not_onsell = false}, -- Crinière de badoul
	-- ANNEAU (gauche) 	== 2 --
	{ id = 8221, niv = 8, price = 1000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Piou Violet
	{ id = 2441, niv = 31, price = 30000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Royal du Bouftou
	{ id = 9123, niv = 50, price = 50000, postion = 2, go_buy = false, not_onsell = false}, -- Blopanneau terre
	{ id = 9127, niv = 80, price = 200000, postion = 2, go_buy = false, not_onsell = false}, -- Blopanneau terre Royal
	-- CEINTURE 		== 3 --
	{ id = 8241, niv = 9, price = 1000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture du Piou Jaune
	{ id = 2428, niv = 20, price = 10000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture Bouf
	{ id = 2444, niv = 30, price = 30000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture Bouf Royal
	{ id = 9168, niv = 50, price = 50000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture terre
	{ id = 9172, niv = 80, price = 200000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture terre Royal
	-- ANNEAU (droite) 	== 4 --
	{ id = 8223, niv = 11, price = 1000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau du Piou Jaune
	{ id = 2419, niv = 20, price = 10000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau Bouf
	{ id = 6944, niv = 43, price = 20000, postion = 4, go_buy = false, not_onsell = false}, -- Scaraneau Vert
	{ id = 2469, niv = 60, price = 250000, postion = 4, go_buy = false, not_onsell = false},  -- Gelano
	-- BOTTES 			== 5 --
	{ id = 8229, niv = 10, price = 1000, postion = 5, go_buy = false, not_onsell = false}, -- Sandales du Piou Jaune
	{ id = 2422, niv = 20, price = 10000, postion = 5, go_buy = false, not_onsell = false}, -- Boufbottes
	{ id = 2442, niv = 30, price = 50000, postion = 5, go_buy = false, not_onsell = false}, -- Boufbottes Royales
	{ id = 9159, niv = 50, price = 50000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes terre
	{ id = 9163, niv = 80, price = 200000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes terre Royal
	-- CHAPEAU 			== 6 --
	{ id = 8247, niv = 7, price = 1000, postion = 6, go_buy = false, not_onsell = false}, -- Chapeau du Piou Jaune
	{ id = 2411, niv = 20, price = 10000, postion = 6, go_buy = false, not_onsell = false}, -- Coiffe Bouf
	{ id = 703, niv = 36, price = 30000, postion = 6, go_buy = false, not_onsell = false},  -- Dora
	{ id = 2410, niv = 45, price = 50000, postion = 6, go_buy = false, not_onsell = false},  -- Abracaska
	{ id = 2531, niv = 60, price = 200000, postion = 6, go_buy = false, not_onsell = false}, -- Caracoiffe
	-- CAPE 			== 7 --
	{ id = 8236, niv = 9, price = 1000, postion = 7, go_buy = false, not_onsell = false}, -- Cape du Piou Jaune
	{ id = 2414, niv = 20, price = 10000, postion = 7, go_buy = false, not_onsell = false}, -- Cape Bouffante
	{ id = 2445, niv = 29, price = 20000, postion = 7, go_buy = false, not_onsell = false}, -- Cape Bouffante Royal
	{ id = 7552, niv = 50, price = 80000, postion = 7, go_buy = false, not_onsell = false}, -- Capodindo

	-- TROPH 1 = 9
	{ id = 12727, niv = 50, price = 100000, postion = 9, go_buy = false, not_onsell = false}, -- Survivant mineur
	-- TROPH 2 = 10
	{ id = 13757, niv = 50, price = 100000, postion = 10, go_buy = false, not_onsell = false}, -- Forcené mineur
	-- TROPH 3 = 11
	{ id = 12748, niv = 50, price = 100000, postion = 11, go_buy = false, not_onsell = false}, -- Ravageur Terre mineur
	-- TROPH 4 = 12
	{ id = 12722, niv = 50, price = 100000, postion = 12, go_buy = false, not_onsell = false}, -- Furibond mineur
	-- TROPH 5 = 13
	{ id = 13823, niv = 50, price = 100000, postion = 13, go_buy = false, not_onsell = false}, -- Puissant mineur
	-- TROPH 6 = 14
	{ id = 13751, niv = 50, price = 100000, postion = 14, go_buy = false, not_onsell = false}, -- Vagabond mineur

	-- BOUCLIER 		== 15 --
	{ id = 18714, niv = 5, price = 2000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier du tournesol sauvage
	{ id = 18666, niv = 20, price = 10000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier Bouf
	{ id = 18659, niv = 25, price = 50000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier en Mousse
	{ id = 18710, niv = 35, price = 150000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier du chafer fantassin

}

local stuffPanda = {
	-- AMULETTE 		== 0 --
	{ id = 8217, niv = 12, price = 1000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette du Piou Jaune
	{ id = 2425, niv = 20, price = 10000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Bouf
	{ id = 2443, niv = 28, price = 50000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Royale du Bouftou
	{ id = 9150, niv = 50, price = 50000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop terre
	{ id = 9154, niv = 80, price = 200000, postion = 0, go_buy = false, not_onsell = false}, -- Amulette Blop terre Royal
	-- ARME				== 1 --
	{ id = 16527, niv = 8, price = 10000, postion = 1, go_buy = false, not_onsell = false}, -- Marteau de Hargnok
	{ id = 2416, niv = 20, price = 10000, postion = 1, go_buy = false, not_onsell = false}, -- Marteau Bouf
	{ id = 66, niv = 33, price = 30000, postion = 1, go_buy = false, not_onsell = false}, -- Crinière de badoul
	-- ANNEAU (gauche)	== 2 --
	{ id = 8221, niv = 8, price = 1000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Piou Violet
	{ id = 2441, niv = 31, price = 30000, postion = 2, go_buy = false, not_onsell = false}, -- Anneau Royal du Bouftou
	{ id = 9123, niv = 50, price = 50000, postion = 2, go_buy = false, not_onsell = false}, -- Blopanneau terre
	{ id = 9127, niv = 80, price = 200000, postion = 2, go_buy = false, not_onsell = false}, -- Blopanneau terre Royal
	-- CEINTURE			== 3 --
	{ id = 8241, niv = 9, price = 1000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture du Piou Jaune
	{ id = 2428, niv = 20, price = 10000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture Bouf
	{ id = 2444, niv = 30, price = 30000, postion = 3, go_buy = false, not_onsell = false}, -- Ceinture Bouf Royal
	{ id = 9168, niv = 50, price = 50000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture terre
	{ id = 9172, niv = 80, price = 200000, postion = 3, go_buy = false, not_onsell = false}, -- Blopture terre Royal
	-- ANNEAU (droite) 	== 4 --
	{ id = 8223, niv = 11, price = 1000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau du Piou Jaune
	{ id = 2419, niv = 20, price = 10000, postion = 4, go_buy = false, not_onsell = false}, -- Anneau Bouf
	{ id = 6944, niv = 43, price = 20000, postion = 4, go_buy = false, not_onsell = false}, -- Scaraneau Vert
	{ id = 2469, niv = 60, price = 250000, postion = 4, go_buy = false, not_onsell = false},  -- Gelano
	-- BOTTES 			== 5 --
	{ id = 8229, niv = 10, price = 1000, postion = 5, go_buy = false, not_onsell = false}, -- Sandales du Piou Jaune
	{ id = 2422, niv = 20, price = 10000, postion = 5, go_buy = false, not_onsell = false}, -- Boufbottes
	{ id = 2442, niv = 30, price = 50000, postion = 5, go_buy = false, not_onsell = false}, -- Boufbottes Royales
	{ id = 9159, niv = 50, price = 50000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes terre
	{ id = 9163, niv = 80, price = 200000, postion = 5, go_buy = false, not_onsell = false}, -- Bloptes terre Royal
	-- CHAPEAU 			== 6 --
	{ id = 8247, niv = 7, price = 1000, postion = 6, go_buy = false, not_onsell = false}, -- Chapeau du Piou Jaune
	{ id = 2411, niv = 20, price = 10000, postion = 6, go_buy = false, not_onsell = false}, -- Coiffe Bouf
	{ id = 703, niv = 36, price = 30000, postion = 6, go_buy = false, not_onsell = false},  -- Dora
	{ id = 2410, niv = 45, price = 50000, postion = 6, go_buy = false, not_onsell = false},  -- Abracaska
	{ id = 2531, niv = 60, price = 200000, postion = 6, go_buy = false, not_onsell = false}, -- Caracoiffe
	-- CAPE 			== 7 --
	{ id = 8236, niv = 9, price = 1000, postion = 7, go_buy = false, not_onsell = false}, -- Cape du Piou Jaune
	{ id = 2414, niv = 20, price = 10000, postion = 7, go_buy = false, not_onsell = false}, -- Cape Bouffante
	{ id = 2445, niv = 29, price = 20000, postion = 7, go_buy = false, not_onsell = false}, -- Cape Bouffante Royal
	{ id = 7552, niv = 50, price = 80000, postion = 7, go_buy = false, not_onsell = false}, -- Capodindo

	-- TROPH 1 = 9
	{ id = 12727, niv = 50, price = 100000, postion = 9, go_buy = false, not_onsell = false}, -- Survivant mineur
	-- TROPH 2 = 10
	{ id = 13757, niv = 50, price = 100000, postion = 10, go_buy = false, not_onsell = false}, -- Forcené mineur
	-- TROPH 3 = 11
	{ id = 12748, niv = 50, price = 100000, postion = 11, go_buy = false, not_onsell = false}, -- Ravageur Terre mineur
	-- TROPH 4 = 12
	{ id = 12722, niv = 50, price = 100000, postion = 12, go_buy = false, not_onsell = false}, -- Furibond mineur
	-- TROPH 5 = 13
	{ id = 13823, niv = 50, price = 100000, postion = 13, go_buy = false, not_onsell = false}, -- Puissant mineur
	-- TROPH 6 = 14
	{ id = 13751, niv = 50, price = 100000, postion = 14, go_buy = false, not_onsell = false}, -- Vagabond mineur

	-- BOUCLIER 		== 15 --
	{ id = 18714, niv = 5, price = 2000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier du tournesol sauvage
	{ id = 18666, niv = 20, price = 10000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier Bouf
	{ id = 18659, niv = 25, price = 50000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier en Mousse
	{ id = 18710, niv = 35, price = 150000, postion = 15, go_buy = false, not_onsell = false}, -- Bouclier du chafer fantassin

}

	if class == nil then
		class = character:breed()
	end
	if class == 1 then -- Feca
		return stuffFeca
	elseif class == 3 then -- Enu
		return stuffEnu
	elseif class == 7 then -- Eni
		return stuffEni
	elseif class == 8 then -- Iop
		return stuffIop
	elseif class == 9 then -- Cra
		return stuffCra
	elseif class == 10 then -- Sadida
		return stuffSadi
	elseif class == 11 then -- Sacri
		return stuffSacri
	elseif class == 12 then -- Panda
		return stuffPanda
	else
		printF.error("objectStuff.lua -> Cette classe n'existe pas.")
		return nil
	end
end

return objectStuff
