local iaManager =  {}


dofile("scripts\\IA\\Functions\\includes.lua")
dofile("scripts\\IA\\Manager\\includes.lua")
dofile("scripts\\IA\\Target\\includes.lua")

iaClass = nil

if character:breed() == 1 then -- Feca
	iaClass = dofile("scripts\\IA\\Class\\Feca\\iaFeca.lua")
elseif character:breed() == 3 then -- Enu
	iaClass = dofile("scripts\\IA\\Class\\Enu\\iaEnu.lua")
elseif character:breed() == 7 then -- Eni
	iaClass = dofile("scripts\\IA\\Class\\Eni\\iaEni.lua")
elseif character:breed() == 8 then -- Iop
	iaClass = dofile("scripts\\IA\\Class\\Iop\\iaIop.lua")
elseif character:breed() == 9 then -- Cra
	iaClass = dofile("scripts\\IA\\Class\\Cra\\iaCra.lua")
elseif character:breed() == 10 then -- Sadi
	iaClass = dofile("scripts\\IA\\Class\\Sadi\\iaSadi.lua")
elseif character:breed() == 11 then -- Sacri
	iaClass = dofile("scripts\\IA\\Class\\Sacri\\iaSacri.lua")
elseif character:breed() == 12 then -- Panda
	iaClass = dofile("scripts\\IA\\Class\\Panda\\iaPanda.lua")
end

function iaManager.main()
	if fightCharacter:isItMyTurn() then
		iaPrint.info("Début du tour")

		if iaClass == nil then
			iaPrint.error("La classe n'est pas géré par le programe.")
		else
			iaClass.main()
		end

		iaPrint.info("Fin du tour")
		fightAction:passTurn() -- Je passe mon tour
	end
end

return iaManager
