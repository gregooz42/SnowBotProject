local initTEAM = {}

MEM_TEAM_S = character:server() .. "TEAM"
GROUP_LEVEL = nil

function initMemoryTEAM()
	printF.debug("initTEAM.lua", "initMemoryTEAM()")

	local memoryTeam = {
		path = 1
	}
	if developer:getInGlobalMemory(MEM_TEAM_S) == nil then
		developer:addInGlobalMemory(MEM_TEAM_S, memoryTeam)
		printF.info("On initialise le trajet #" .. memoryTeam.path)
	else
		local memTeam = developer:getInGlobalMemory(MEM_TEAM_S)
		printF.info("On reprend le trajet #" .. memTeam.path)
	end
end

function initTEAM.main()
	printF.debug("initTEAM.lua", "main()")

	initMemoryTEAM()
	GROUP_LEVEL = toolTEAM.getGroupLevel()
	printF.info("Niveau du groupe:" .. GROUP_LEVEL)

	if thisAccount.isTeamLeader() then
		global:delay(1000)
		printF.info("J'invite la Team en groupe.")
		global:inviteTeamInGroup()
		global:delay(500)
	end
	if accountController.groupIsFree()
	and GROUP_LEVEL > 400 then
		printF.warning("Le groupe n'est pas abonné.")
		global:finishScript()
	end
end

return initTEAM
