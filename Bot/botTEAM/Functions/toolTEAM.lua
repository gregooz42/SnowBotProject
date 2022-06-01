local toolTEAM = {}

function toolTEAM.getGroupLevel()
	printF.debug("toolTEAM.lua", "getGroupLevel()")

	local groupLevel = 0
	local idBANK = data.getIdBANK()
	local idHDV = data.getIdHDV()

	for _, account in ipairs(snowbotController:getLoadedAccounts()) do
		if (account.character()).name() ~= nil
		and character:server() == (account.character()).server()
		and (account.character()).identifier() ~= idBANK
		and	(account.character()).identifier() ~= idHDV
		and account.isItATeam()
		then
			groupLevel = groupLevel + (account.character()).level()
		end
	end
	return groupLevel
end

return toolTEAM
