local printF = {}

COLOR_JAUNE	= "#FFC300"
COLOR_BLUE	= "#00A8FF"
COLOR_BLUE_CLAIR = "#9ADDFF"

DEBUG_MODE	= true
DEBUG_MODEM	= false

function printF.debug(stringFile, stringFunction)
	if DEBUG_MODE then

		local message = "> [" .. stringFile .. "] " .. stringFunction

		global:printColor(message, COLOR_JAUNE)
	end
end

-- Débug Maximal, active les petites fonctions répétitives
function printF.debugM(stringFile, stringFunction)
	if DEBUG_MODEM then

		local message = "> [" .. stringFile .. "] " .. stringFunction

		global:printColor(message, COLOR_JAUNE)
	end
end

function printF.delay(string)

	local message = "[Delay] " .. string

	global:printColor(message, COLOR_BLUE_CLAIR)
end

function printF.hdv(string)

	local message = "[Hdv] " .. string

	global:printColor(message, COLOR_BLUE)
end

function printF.success(string)
	global:printSuccess("[Info] " .. string)
end

function printF.error(string)
	global:printError("[Error] " .. string)
end

function printF.warning(string)
	global:printError("[Warning] " .. string)
end

function printF.info(string)
	global:printMessage("[Info] " .. string)
end

function printF.Start()
	printF.info("				Réglages :			   ")
	printF.info("Le bot se déconnecte si il se perd:	 " .. tostring(DISCONNECT_ON_LOST))
	printF.info("			   Personnage :			   ")
	printF.info("Personnage:	" .. character:name())
	printF.info("Identifiant:		" .. character:identifier())
	printF.info("Serveur:		   " .. character:server())
end

return printF
