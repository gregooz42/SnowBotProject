local stoppedManager =  {}


function stoppedManager.main()
	printF.debug("stoppedManager.lua", "main()")

	printF.error("Le bot est perdu.")
	if DISCONNECT_ON_LOST then
		global:disconnect()
	else
		global:finishScript()
	end
end

-- function stopped()
--acc = global:getController()
--if (acc.isTeamLeader()) then
 --  global:reloadScript()
--end
--end

return stoppedManager
