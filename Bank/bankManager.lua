local bankManager =  {}

if character:freeMode() then
	resetBank = dofile("scripts\\Bank\\resetBankFree.lua")
else
	resetBank = dofile("scripts\\Bank\\resetBank.lua")
end

function checkFinishScript()
	printF.debug("bankManager.lua", "checkFinishScript()")

	if map:onMap("192415750") then
		if map:currentCell() == 409 then
			map:moveToCell(426)
			delayF.wait(3)
		end
		return map:moveToCell(409)
	elseif map:onMap("191104002") then -- Bank Astrub Extérieur
		global:finishScript()
	else
		return goToBank()
	end
end

function goToBank()
	printF.debug("bankManager.lua", "goToBank()")

	if map:currentArea() == "Incarnam" then
		return resetF.incarnamToAstrub()
	end
	if character:freeMode() then
		return resetBank.astrub()
	else
		return resetBank.astrub()
	end
end

function bankManager.main()
	printF.debug("bankManager.lua", "main()")

	if inventory:podsP() < 20 then
		return checkFinishScript()
	end

	if map:onMap("192415750") then -- Bank Astrub Intérieur
		exchangeManager.secureInventory()
		return map:moveToCell(409)
	else
		return goToBank()
	end
end

return bankManager
