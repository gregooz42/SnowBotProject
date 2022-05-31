dofile("scripts\\miniScripts\\includes.lua")

START_SCRIPT = true

function move()
	printF.debug("goGroup.lua", "move()")

	-- On gère les idoles

	if START_SCRIPT then
		inventoryF.checkFami()
		START_SCRIPT = false
	end
	--if character:breed() == 9
	--and not character:freeMode()
	--	if not map:onMap("162791424") then
	--		return map:changeMap("havenbag")
	--	else
	--		START_SCRIPT = false
	--		return idolsF.recupIdols()
	--	end
	--end

	printF.info("Je reset à Astrub !")
	if map:onMap("5,-18") then
		printF.info("Je suis arrivé.")
		map:saveZaap()
		global:finishScript()
	end
	return resetF.zapAstrub()
end

function bank()
	printF.debug("goGroup.lua", "bank()")

	printF.info("Je reset à Astrub !")

	if map:onMap("5,-18") then
		printF.info("Je suis arrivé.")
		global:finishScript()
	end
	return resetF.zapAstrub()
end

function phenix()
	printF.debug("goGroup.lua", "phenix()")

	return phenixManager.main()
end

function stopped()
	printF.debug("goGroup.lua", "stopped()")

	return stoppedManager.main()
end
