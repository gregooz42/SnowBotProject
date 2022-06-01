local moveManager = {}

SCRIPT_START = true
RESET_POS = false

function checkLevelUp()
	printF.debug("moveManager.lua", "checkLevelUp()")

	local level = toolTEAM.getGroupLevel()

	if level ~= GROUP_LEVEL then
		GROUP_LEVEL = level
		-- Reset pos pour les niveau de changement de zone
		if (level == 150 and character:freeMode()) --free.all() to free.all_big()
		or (level == 290 and not character:freeMode()) -- cania_team.lua à all250_50.lua
		then
			RESET_POS = true
			return move()
		end
	end
end



function moveManager.main()
	printF.debug("moveManager.lua", "main()")

	--checkLevelUp()

	--utils_team.delay_move()
	if SCRIPT_START then
		initTEAM.main()
		SCRIPT_START = false
	end

	if RESET_POS then
		if map:onMap("5,-18") then
			RESET_POS = false
		else
			return resetF.zapAstrub()
		end
	end

	area.checkPath()

	if GROUP_LEVEL < 15 then
		return incarnam_team.main()
	elseif GROUP_LEVEL < 60 then
		return astrub_team.main()
	else
		if not character:freeMode() and GROUP_LEVEL > 200 then
			if GROUP_LEVEL < 290 then
				return cania_team.main()
			elseif GROUP_LEVEL < 600 then
				return all20_50.main()
			else
				return all50_70.main()
			end
		else
			return free_team.main()
		end
	end
end

return moveManager
