local initF = {}

--function utils_config.main()
--	utils.debug("utils.config.lua -> main()")
--	KAMAS_SECURE = utils_config.kamas_secure()
--	KAMAS_SECURE_BANK = utils_config.kamas_secure_bank()
--	if SCRIPT_TEAM then
--		GATHER = {0}
--	else
--		GATHER = gathers_controller.main()
--	end
--	utils_config.check_bot()
--	local xml = dofile(DIRECTORY .. "\\xml\\xml_controller.lua")
--	local path_config = nil
--	if BOT_TYPE == "bank" or BOT_TYPE == "hdv" then
--		path_config = DIRECTORY .. "\\xml\\IA_bank.xml"
--	else
--		path_config = xml.get_config()
--	end
--	global:printSuccess("Chemin : " .. path_config)
--	global:loadConfiguration(path_config)
--end

return initF
