thisAccount	= global:getController()

dofile("scripts\\Bot\\botHDV\\includes.lua")

function move()
	printF.debug("HDV.lua", "move()")

	return moveManager.main()
end

function bank()
	printF.debug("HDV.lua", "bank()")

	return moveManager.main()
end

function phenix()
	printF.debug("HDV.lua", "phenix()")

	return phenixManager.main()
end

function stopped()
	printF.debug("HDV.lua", "stopped()")

	return stoppedManager.main()
end

function messagesRegistering()
	printF.debug("HDV.lua", "messagesRegistering()")

	registerManager.main()
end

function fightManagement()
	printF.debug("HDV.lua", "fightManagement()")

	iaManager.main()
end

