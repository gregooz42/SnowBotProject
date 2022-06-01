local moveManager = {}

EXCHANGE_IS_FINISH = false
START_SCRIPT = true

function moveManager.main()
	printF.debug("moveManager.lua", "main()")

	if EXCHANGE_IS_FINISH then
		if HDV_ON then
			return hdvManager.main()
		else
			global:disconnect()
		end
	else
		return manageTeam()
	end
end

function initHDV()
	printF.debug("moveManager.lua","initHDV()")

	if not inventoryController.teamIsFull() then
		printF.info("La team n'a pas besoin d'être vidée.")
		EXCHANGE_IS_FINISH = true
	end
end

function manageTeam()
	printF.debug("moveManager.lua", "manageTeam()")

	if not map:onMap("192415750") then
		return resetF.bankAstrub()
	end
	printF.info("Je suis arrivé à la banque.")

	if toolF.isOnPlanning(delayF.getThisHour(), PLANNING_TEAM) then
		printF.info("La team se repose.")
	else
		servController.charge()
		if START_SCRIPT then
			initHDV()
			START_SCRIPT = false
		end
		if not EXCHANGE_IS_FINISH then
			toolF.privateStatus(false)
			exchangeController.manageTeamInventory()
			stuffController.main()
			toolF.privateStatus(true)
		end
		botController.initTEAM()
	end

	printF.info("Tout est prêt, on go à l'hdv.")

	EXCHANGE_IS_FINISH = true
	return map:moveToCell(409)
end

return moveManager
