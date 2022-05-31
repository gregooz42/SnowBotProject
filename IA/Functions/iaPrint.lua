local iaPrint = {}

IA_DEBUG_MODE	= false
IA_DEBUG_MODEM	= false

function iaPrint.debug(stringFile, stringFunction)
	if IA_DEBUG_MODE then
		local message = "> [" .. stringFile .. "] " .. stringFunction
		fightDebug:print(message)
	end
end

function iaPrint.spell(stringSpell)
	local message = "[Spell] " .. stringSpell
	fightDebug:print(message)
end

function iaPrint.debugM(stringFile, stringFunction)
	if IA_DEBUG_MODEM then
		local message = "> [" .. stringFile .. "] " .. stringFunction
		fightDebug:print("> " .. message)
	end
end

function iaPrint.info(message)
	fightDebug:print("[Info] " .. message)
end

function iaPrint.error(message)
	fightDebug:print("[Error] " .. message)
end

return iaPrint
