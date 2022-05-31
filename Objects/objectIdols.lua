local objectIdols = {}

function objectIdols.getIdols()
	printF.debug("objectIdols.lua", "getIdols()")

	local idols = {
		16986, -- Pého mineure
		16987, -- Pého
		16988, -- Pého majeure
		16990, -- Domo mineure
		16991, -- Domo
		16358, -- Dynamo mineure
		16864, -- Dynamo
		16865, -- Dynamo majeure
		16973, -- Pétunia mineure
		16666, -- Nyoro mineure
		16851, -- Bihilète mineure
		16852, -- Bihilète
		16853, -- Bihilète majeure
		16854, -- Bihilète magistrale
		16847, -- Horize mineure
		16855, -- Dagob mineure
		16955, -- Hulhu mineure
		16956, -- Hulhu
		16859, -- Sak mineur
		16842, -- Butor mineur
		16844, -- Butor
		16963, -- Kyoub mineure
		16964, -- Kyoub
	}
	return idols
end

return objectIdols
