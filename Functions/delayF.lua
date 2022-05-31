local delayF = {}

TIME_OS_START = os.clock() --initialisation du temps, le script sait à quelle heure il a demarré
TIME_PERCENT = 0

math.randomseed(TIME_OS_START)

TIME_CONNECT = ( math.random(660 / 10, 660) + (math.random(50) / 50) - 0.5 ) * 60
TIME_DECONNECT = 1000 -- à CHANGER

function delayF.randomMin(timeMin1, timeMin2)
	printF.debugM("delayF.lua", "randomMin(" .. timeMin1 ..", " .. timeMin2 ..")")
	timeMin1 = timeMin1 * 1000 * 60
	timeMin2 = timeMin2 * 1000 * 60
	local finalTime = math.random(timeMin1, timeMin2)
	printF.delay(math.floor(finalTime / 60000) .. " minutes.")
	global:delay(finalTime)
end

function delayF.random(timeSec1, timeSec2)
	printF.debugM("delayF.lua", "random(" .. timeSec1 ..", " .. timeSec2 ..")")
	timeSec1 = timeSec1 * 1000
	timeSec2 = timeSec2 * 1000
	local finalTime = math.random(timeSec1, timeSec2)
	if finalTime / 1000 > 5 then
		printF.delay(math.floor(finalTime / 1000) .. " secondes.")
	end
	global:delay(finalTime)
end

function delayF.randomM(time1, time2)
	printF.debugM("delayF.lua", "randomM(" .. time1 ..", " .. time2 ..")")
	global:delay(math.random(time1, time2))
end

function delayF.wait(timeSec)
	printF.debugM("delayF.lua", "wait(" ..  timeSec..")")
	printF.delay(timeSec .. " secondes.")
	timeSec = timeSec * 1000
	global:delay(timeSec)
end

function delayF.waitM(time)
	printF.debugM("delayF.lua", "waitM(" ..  time..")")
	global:delay(time)
end

function delayF.getTimeDeconnect()
	printF.debug("delayF.lua", "getTimeDeconnect()")

	local timeDeconnect = nil
	local currentUTCTime = os.date('!*t')
	local thisHour = ((timeDeconnect / 60) + currentUTCTime.hour + 1)

	if (TIME_CONNECT / 60) < math.random(1, 300) then
		timeDeconnect = math.random(60 / 10, 60) + (math.random(50) / 50) - 0.5
	elseif (TIME_CONNECT / 60) < math.random(1, 450) then
		timeDeconnect = math.random(197 / 4, 197) + (math.random(50) / 50) - 0.5
	elseif (TIME_CONNECT / 60) < math.random(1, 600) then
		timeDeconnect = math.random(690 / 3, 690) + (math.random(50) / 50) - 0.5
	else
		timeDeconnect = math.random(1400 / 2, 1400) + (math.random(50) / 50) - 0.5
	end

	while toolF.isOnPlanning(thisHour, PLANNING) do
		thisHour = thisHour + 1
	end

	timeDeconnect = (thisHour - currentUTCTime.hour) * 60

	return timeDeconnect
end

function delayF.getThisHour()
	printF.debug("delayF.lua", "getThisHour()")

	local currentUTCTime = os.date('!*t')
	local thisHour = currentUTCTime.hour + 2
	if thisHour >= 24 then
		thisHour = thisHour - 24
	end
	printF.success("thisHour = " .. thisHour)
	return thisHour
end

function delayF.getTimeDeconnectBANK()
	printF.debug("delayF.lua", "getTimeDeconnectBANK()")

	local timeDeconnect = math.random(120, 240) + (math.random(50) / 50) - 0.5
	local currentUTCTime = os.date('!*t')
	local thisHour = ((timeDeconnect / 60) + currentUTCTime.hour + 1)

	while toolF.isOnPlanning(thisHour, PLANNING) do
		thisHour = thisHour + 1
	end
	timeDeconnect = (thisHour - currentUTCTime.hour) * 60

	return timeDeconnect
end

function delayF.timeMove()
	printF.debug("delayF.lua", "timeMove()")

	local t0 = os.clock()
	local timeSleep = getTimeMove()

	while os.clock() < timeSleep do
		delayF.waitM(100)
	end

	local tempsRestant = TIME_OS_START + 10 * (os.clock() - t0) + TIME_CONNECT - os.clock()

	if tempsRestant < 0 then
		global:reconnectBis((TIME_DECONNECT / 60))
	end
	if 100 * (1 - tempsRestant / TIME_CONNECT) - TIME_PERCENT >= 3 then
		TIME_PERCENT = math.floor(100 * (1 - tempsRestant / TIME_CONNECT))
		printF.info("Temps écoulé: " .. TIME_PERCENT .. "% soit " .. math.floor((TIME_CONNECT - tempsRestant) / 60) .. "/".. math.floor(TIME_CONNECT / 60) .. " minutes.")
	end
end

-- Retourte un delay aleatoire simulant un changement de map
function getTimeMove()
	printF.debug("delayF.lua", "getTimeMove()")

	math.randomseed(os.time() + 17)

	local y = math.random(1000)
	local x = math.randomseed(os.time())
	local t0 = os.clock()

	if y < 10 then
		x = t0 + math.random(1) + math.random(300) + (math.random(50) / 50) - 0.5
	elseif y < 20 then
		x = t0 + math.random(1) + math.random(60) + (math.random(50) / 50) - 0.5
	elseif y < 50 then
		x = t0 + math.random(1) + math.random(15) + (math.random(50) / 50) - 0.5
	elseif y < 200 then
		x = t0 + math.random(1) + math.random(5) + (math.random(50) / 50) - 0.5
	else
		x = t0 + math.random(1) + (math.random(50) / 50) - 0.
	end
	return x
end

return delayF
