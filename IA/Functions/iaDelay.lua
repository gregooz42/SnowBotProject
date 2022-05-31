local iaDelay =  {}

IA_DELAY = false

function iaDelay.spell()

	local thisDelay = math.random(500, 1500)

	if IA_DELAY then
		fightDebug:print("[Info] Temps de pause: " .. tostring(thisDelay / 1000) .. " secondes.")
		fightDebug:delay(thisDelay)
	end
end

function iaDelay.move()

	local thisDelay = math.random(2000, 3000)

	if IA_DELAY then
		fightDebug:print("[Info] Temps de pause: " .. tostring(thisDelay / 1000) .. " secondes.")
		fightDebug:delay(thisDelay)
	end
end

return iaDelay
