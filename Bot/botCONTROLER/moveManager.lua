local moveManager = {}

SERVEUR = {
	{name = "Agride", delay = 0, free = false},
	{name = "Furye", delay = 0, free = false},
}

function moveManager.main()
	printF.debug("moveManager.lua", "main()")

	teamCONTROLER.main()
	hdvCONTROLER.main()
end

return moveManager
