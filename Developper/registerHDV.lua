local registerHDV = {}

STEEP_EXCHANGE	= 1
ID_TO_WAIT		= nil

function registerHDV.main()
	printF.debug("registerHDV.lua", "main()")

	developer:registerMessage("ExchangeRequestedTradeMessage", exchangeStartHDV)
	developer:registerMessage("ExchangeIsReadyMessage", readyExchange)
	developer:registerMessage("ChatServerMessage", checkMp)
end

function exchangeStartHDV(message)
	printF.debug("registerHDV.lua", "exchangeStartHDV()")

	printF.info("Début d'un échange.")
	local group = accountController.getGroup()
	local bot = userController.getIdController(message.source)

	if userController.isOnGroup(bot.getUsername(), group) then
		global:delay(math.random(250,500))

		local monMessage = developer:createMessage("ExchangeAcceptMessage")
		developer:sendMessage(monMessage)

		global:delay(math.random(250,500))

		STEEP_EXCHANGE = 1

		for i, offrand in ipairs(KAMAS_TO_GIVE) do
			printF.info("Niveau moyen d'équipements:" .. math.floor(offrand.nivStuff / 14) .. ", Kamas nécessaires:" .. offrand.kamas)
			if tostring(offrand.id) == tostring(message.source)
			and offrand.kamas > 0
			then
				printF.info("Je donne " .. offrand.kamas .. " Kamas." )
				exchange:putKamas(offrand.kamas)
				offrand.kamas = 0
				KAMAS_TO_GIVE[i].kamas = 0
				STEEP_EXCHANGE = 2
			end
		end
	else
		printF.warning("Echange d'un Joueur inconnu.")
	end
end

function readyExchange()
	printF.debug("registerHDV.lua", "readyExchange()")

	local monMessage = developer:createMessage("ExchangeReadyMessage")

	monMessage.ready = true
	monMessage.steep = STEEP_EXCHANGE

	global:delay(math.random(500,1500))
	printF.success("J'accèpte l'échange.")
	developer:sendMessage(monMessage)
	global:delay(math.random(500,1500))
end

function checkMp(message)
	printF.debug("registerHDV.lua", "checkMp()")

	if tostring(message.senderId) == tostring(ID_TO_WAIT)
	and message.channel == 9
	then
		printF.info("Nous venons de recevoir un message privé de " .. message.senderName .. " ! On débloque ID_TO_WAIT")
		ID_TO_WAIT = nil
	end
end

return registerHDV
