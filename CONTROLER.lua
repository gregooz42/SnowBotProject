thisAccount = global:getController()

dofile("scripts\\Bot\\botCONTROLER\\includes.lua")

function move()
	printF.debug("CONTROLLER.lua", "move()")

	while true do
		moveManager.main()
		delayF.random(30, 60)
		printF.success("Actualisation...")
	end
end
