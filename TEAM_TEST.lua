thisAccount = global:getController()
teamAccounts = thisAccount:getTeamAccounts()

dofile("scripts\\Bot\\botTEAM\\includes.lua")

--if thisAccount.isTeamLeader() then
--
--	local path = DIRECTORY .. "TEAM.lua"
--
--	for _, bot in ipairs(teamAccounts) do
--		if not bot.isTeamLeader() then
--			bot.loadScript(path)
--		end
--	end
--end

SYNC_MOVE = true

function move()
	printF.debug("TEAM.lua", "move()")

	return moveManager.main()
end

function bank()
	printF.debug("TEAM.lua", "bank()")

	botController.initHDV()
	global:finishScript()
end

function phenix()
	printF.debug("TEAM.lua", "phenix()")

	return phenixManager.main()
end

function stopped()
	printF.debug("TEAM.lua", "stopped()")

	return stoppedManager.main()
end



function prefightManagement(challengersCells, defendersCells)
	printF.debug("TEAM.lua", "prefightManagement()")

	prefightManager.main(challengersCells, defendersCells)
end

function fightManagement()
	printF.debug("TEAM.lua", "fightManagement()")

	iaManager.main()
end
