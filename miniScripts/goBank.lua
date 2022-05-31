dofile("scripts\\miniScripts\\includes.lua")

START_SCRIPT = true

function main()
	printF.debug("goBank.lua", "main()")

	-- On gère les idoles
	--if character:breed() == 9
	--and not character:freeMode()
	--and START_SCRIPT then -- Cra LEAD

	--	if not map:onMap("162791424") then
	--		return map:changeMap("havenbag")
	--	else
	--		START_SCRIPT = false
	--		return idolsF.secureIdol()
	--	end
	--end

	return bankManager.main()
end


function move()
	return main()
end

function bank()
	return main()
end

function phenix()
	printF.debug("goBank.lua", "phenix()")

	return phenixManager.main()
end

function stopped()
	printF.debug("goBank.lua", "stopped()")

	return stoppedManager.main()
end
