dofile("scripts\\miniScripts\\includes.lua")

function move()
	printF.debug("goStuff.lua", "move()")

	if STUFF_ON then
		return stuffManager.main()
	else
		printF.success("Le stuff est terminé.")

		local idHDV = data.getIdHDV()
		local userHDV = userController.getBotUser(idHDV)
		local receiver = userController.getBotName(userHDV)
		local message = objectChat.goStuff_MP()
		chat:sendPrivateMessage(message, receiver)
		global:finishScript()
	end
end

function messagesRegistering()
	printF.debug("goStuff.lua", "messagesRegistering()")
	registerStuff.main()
end

function bank()
	printF.debug("goStuff.lua", "bank()")
	global:finishScript()
end

function stopped()
	printF.debug("goStuff.lua", "stopped()")

	return stoppedManager.main()
end

function phenix()
	printF.debug("goStuff.lua", "phenix()")

	return phenixManager.main()
end
