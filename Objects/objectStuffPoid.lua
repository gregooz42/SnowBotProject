local objectStuffPoid = {}

	--	{id = 111, poid = 100}, -- PA
	--	{id = 128, poid = 90}, -- PM
	--	{id = 117, poid = 51}, -- Po
	--	{id = 182, poid = 30}, -- Invo
	--	{id = 112, poid = 20}, -- Do
	--	{id = 2808, poid = 15}, -- Do Per Ar
	--	{id = 2804, poid = 15}, -- Do Per Di
	--	{id = 2800, poid = 15}, -- Do Per Mé
	--	{id = 2812, poid = 15}, -- Do Per So
		--{id = 0, poid = 15}, -- Ré Per Di
	--	{id = 2803, poid = 15}, -- Ré Per Mé
	--	{id = 178, poid = 10}, -- So
	--	{id = 115, poid = 10}, -- Cri
		--{id = 0, poid = 10}, -- Do ren
	--	{id = 412, poid = 7}, -- Ret PM
	--	{id = 410, poid = 7}, -- Ret PA
	--	{id = 161, poid = 7}, -- Ré PM
	--	{id = 160, poid = 7}, -- Ré PA
	--	{id = 210, poid = 6}, -- Ré per terre
	--	{id = 211, poid = 6}, -- Ré per eau
	--	{id = 214, poid = 6}, -- Ré per neutre
	--	{id = 213, poid = 6}, -- Ré per feu
	--	{id = 212, poid = 6}, -- Ré per air
	--	{id = 422, poid = 5}, -- Do terre
	--	{id = 426, poid = 5}, -- Do eau
	--	{id = 430, poid = 5}, -- Do neutre
	--	{id = 424, poid = 5}, -- Do feu
	--	{id = 428, poid = 5}, -- Do air
	--	{id = 418, poid = 5}, -- Do cri
	--	{id = 414, poid = 5}, -- Do pou
		--{id = 0, poid = 5}, -- Do pi (Do piege)
		--{id = 795, poid = 5}, -- Chasse (Attention value = 0)
	--	{id = 753, poid = 4}, -- Tac
	--	{id = 752, poid = 4}, -- Fui
	--	{id = 176, poid = 3}, -- Prospe
	--	{id = 124, poid = 3}, -- Sa
	--	{id = 229, poid = 2}, -- Pi per (Pui piege)
	--	{id = 138, poid = 2}, -- Pui
	--	{id = 240, poid = 2}, -- Ré terre
	--	{id = 241, poid = 2}, -- Ré eau
	--	{id = 244, poid = 2}, -- Ré neutre
	--	{id = 243, poid = 2}, -- Ré feu
	--	{id = 242, poid = 2}, -- Ré air
	--	{id = 420, poid = 2}, -- Ré cri
	--	{id = 416, poid = 2}, -- Ré pou
	--	{id = 118, poid = 1}, -- Fo
	--	{id = 126, poid = 1}, -- Ine
		--{id = 123, poid = 1}, -- Cha
		--{id = 119, poid = 1}, -- Age
		--{id = 158, poid = 0.25}, -- Pod
		--{id = 125, poid = 0.2}, -- Vi
		--{id = 174, poid = 0.1}, -- Ini

function objectStuffPoid.getPoid()
	printF.debug("objectStuffPoid.lua", "getPoid()")

	local poidFeca = {
		{id = 111, poid = 100}, -- PA
		{id = 128, poid = 90}, -- PM
		{id = 117, poid = 51}, -- Po
		{id = 182, poid = 30}, -- Invo
		{id = 112, poid = 20}, -- Do
		{id = 2804, poid = 15}, -- Do Per Di
		--{id = 0, poid = 15}, -- Ré Per Di
		{id = 115, poid = 10}, -- Cri
		--{id = 0, poid = 10}, -- Do ren
		{id = 412, poid = 7}, -- Ret PM
		{id = 410, poid = 7}, -- Ret PA
		{id = 161, poid = 7}, -- Ré PM
		{id = 160, poid = 7}, -- Ré PA
		{id = 210, poid = 6}, -- Ré per terre
		{id = 211, poid = 6}, -- Ré per eau
		{id = 214, poid = 6}, -- Ré per neutre
		{id = 213, poid = 6}, -- Ré per feu
		{id = 212, poid = 6}, -- Ré per air
		{id = 424, poid = 5}, -- Do feu
		{id = 418, poid = 5}, -- Do cri
		{id = 414, poid = 5}, -- Do pou
		{id = 752, poid = 4}, -- Fui
		{id = 176, poid = 3}, -- Prospe
		{id = 124, poid = 3}, -- Sa
		{id = 138, poid = 2}, -- Pui
		{id = 240, poid = 2}, -- Ré terre
		{id = 241, poid = 2}, -- Ré eau
		{id = 244, poid = 2}, -- Ré neutre
		{id = 243, poid = 2}, -- Ré feu
		{id = 242, poid = 2}, -- Ré air
		{id = 420, poid = 2}, -- Ré cri
		{id = 416, poid = 2}, -- Ré pou
		{id = 126, poid = 1}, -- Ine
		{id = 125, poid = 0.2}, -- Vi
		{id = 174, poid = 0.1}, -- Ini
	}

	local poidEnu = {
		{id = 111, poid = 100}, -- PA
		{id = 128, poid = 90}, -- PM
		{id = 117, poid = 51}, -- Po
		{id = 182, poid = 30}, -- Invo
		{id = 112, poid = 20}, -- Do
		{id = 2804, poid = 15}, -- Do Per Di
		--{id = 0, poid = 15}, -- Ré Per Di
		{id = 115, poid = 10}, -- Cri
		--{id = 0, poid = 10}, -- Do ren
		{id = 412, poid = 7}, -- Ret PM
		{id = 410, poid = 7}, -- Ret PA
		{id = 161, poid = 7}, -- Ré PM
		{id = 160, poid = 7}, -- Ré PA
		{id = 210, poid = 6}, -- Ré per terre
		{id = 211, poid = 6}, -- Ré per eau
		{id = 214, poid = 6}, -- Ré per neutre
		{id = 213, poid = 6}, -- Ré per feu
		{id = 212, poid = 6}, -- Ré per air
		{id = 426, poid = 5}, -- Do eau
		{id = 418, poid = 5}, -- Do cri
		{id = 414, poid = 5}, -- Do pou
		{id = 752, poid = 4}, -- Fui
		{id = 176, poid = 3}, -- Prospe
		{id = 124, poid = 3}, -- Sa
		{id = 138, poid = 2}, -- Pui
		{id = 240, poid = 2}, -- Ré terre
		{id = 241, poid = 2}, -- Ré eau
		{id = 244, poid = 2}, -- Ré neutre
		{id = 243, poid = 2}, -- Ré feu
		{id = 242, poid = 2}, -- Ré air
		{id = 420, poid = 2}, -- Ré cri
		{id = 416, poid = 2}, -- Ré pou
		{id = 123, poid = 1}, -- Cha
		{id = 125, poid = 0.2}, -- Vi
		{id = 174, poid = 0.1}, -- Ini
	}

	local poidEni = {
		{id = 111, poid = 100}, -- PA
		{id = 128, poid = 90}, -- PM
		{id = 117, poid = 51}, -- Po
		{id = 182, poid = 30}, -- Invo
		{id = 112, poid = 20}, -- Do
		{id = 2804, poid = 15}, -- Do Per Di
		--{id = 0, poid = 15}, -- Ré Per Di
		{id = 115, poid = 10}, -- Cri
		{id = 178, poid = 10}, -- So
		--{id = 0, poid = 10}, -- Do ren
		{id = 412, poid = 7}, -- Ret PM
		{id = 410, poid = 7}, -- Ret PA
		{id = 161, poid = 7}, -- Ré PM
		{id = 160, poid = 7}, -- Ré PA
		{id = 210, poid = 6}, -- Ré per terre
		{id = 211, poid = 6}, -- Ré per eau
		{id = 214, poid = 6}, -- Ré per neutre
		{id = 213, poid = 6}, -- Ré per feu
		{id = 212, poid = 6}, -- Ré per air
		{id = 424, poid = 5}, -- Do feu
		{id = 418, poid = 5}, -- Do cri
		{id = 414, poid = 5}, -- Do pou
		{id = 752, poid = 4}, -- Fui
		{id = 176, poid = 3}, -- Prospe
		{id = 124, poid = 3}, -- Sa
		{id = 138, poid = 2}, -- Pui
		{id = 240, poid = 2}, -- Ré terre
		{id = 241, poid = 2}, -- Ré eau
		{id = 244, poid = 2}, -- Ré neutre
		{id = 243, poid = 2}, -- Ré feu
		{id = 242, poid = 2}, -- Ré air
		{id = 420, poid = 2}, -- Ré cri
		{id = 416, poid = 2}, -- Ré pou
		{id = 126, poid = 1}, -- Ine
		{id = 125, poid = 0.2}, -- Vi
		{id = 174, poid = 0.1}, -- Ini
	}

	local poidIop = {
		{id = 111, poid = 100}, -- PA
		{id = 128, poid = 90}, -- PM
		{id = 117, poid = 51}, -- Po
		{id = 182, poid = 30}, -- Invo
		{id = 112, poid = 20}, -- Do
		{id = 2804, poid = 15}, -- Do Per Di
		{id = 2800, poid = 15}, -- Do Per Mé
		--{id = 0, poid = 15}, -- Ré Per Di
		{id = 2803, poid = 15}, -- Ré Per Mé
		{id = 115, poid = 10}, -- Cri
		--{id = 0, poid = 10}, -- Do ren
		{id = 412, poid = 7}, -- Ret PM
		{id = 410, poid = 7}, -- Ret PA
		{id = 161, poid = 7}, -- Ré PM
		{id = 160, poid = 7}, -- Ré PA
		{id = 210, poid = 6}, -- Ré per terre
		{id = 211, poid = 6}, -- Ré per eau
		{id = 214, poid = 6}, -- Ré per neutre
		{id = 213, poid = 6}, -- Ré per feu
		{id = 212, poid = 6}, -- Ré per air
		{id = 422, poid = 5}, -- Do terre
		{id = 426, poid = 5}, -- Do eau
		{id = 418, poid = 5}, -- Do cri
		{id = 753, poid = 4}, -- Tac
		{id = 752, poid = 4}, -- Fui
		{id = 176, poid = 3}, -- Prospe
		{id = 124, poid = 3}, -- Sa
		{id = 138, poid = 2}, -- Pui
		{id = 240, poid = 2}, -- Ré terre
		{id = 241, poid = 2}, -- Ré eau
		{id = 244, poid = 2}, -- Ré neutre
		{id = 243, poid = 2}, -- Ré feu
		{id = 242, poid = 2}, -- Ré air
		{id = 420, poid = 2}, -- Ré cri
		{id = 416, poid = 2}, -- Ré pou
		{id = 123, poid = 1}, -- Cha
		{id = 125, poid = 0.2}, -- Vi
		{id = 174, poid = 0.1}, -- Ini
	}

	local poidCra = {
		{id = 111, poid = 100}, -- PA
		{id = 128, poid = 90}, -- PM
		{id = 117, poid = 51}, -- Po
		{id = 182, poid = 30}, -- Invo
		{id = 112, poid = 20}, -- Do
		{id = 2804, poid = 15}, -- Do Per Di
		--{id = 0, poid = 15}, -- Ré Per Di
		{id = 115, poid = 10}, -- Cri
		--{id = 0, poid = 10}, -- Do ren
		{id = 412, poid = 7}, -- Ret PM
		{id = 410, poid = 7}, -- Ret PA
		{id = 161, poid = 7}, -- Ré PM
		{id = 160, poid = 7}, -- Ré PA
		{id = 210, poid = 6}, -- Ré per terre
		{id = 211, poid = 6}, -- Ré per eau
		{id = 214, poid = 6}, -- Ré per neutre
		{id = 213, poid = 6}, -- Ré per feu
		{id = 212, poid = 6}, -- Ré per air
		{id = 428, poid = 5}, -- Do air
		{id = 418, poid = 5}, -- Do cri
		{id = 414, poid = 5}, -- Do pou
		{id = 752, poid = 4}, -- Fui
		{id = 176, poid = 3}, -- Prospe
		{id = 124, poid = 3}, -- Sa
		{id = 138, poid = 2}, -- Pui
		{id = 240, poid = 2}, -- Ré terre
		{id = 241, poid = 2}, -- Ré eau
		{id = 244, poid = 2}, -- Ré neutre
		{id = 243, poid = 2}, -- Ré feu
		{id = 242, poid = 2}, -- Ré air
		{id = 420, poid = 2}, -- Ré cri
		{id = 416, poid = 2}, -- Ré pou
		{id = 119, poid = 1}, -- Age
		{id = 125, poid = 0.2}, -- Vi
		{id = 174, poid = 0.1}, -- Ini
	}

	local poidSacri = {
		{id = 111, poid = 100}, -- PA
		{id = 128, poid = 90}, -- PM
		{id = 117, poid = 51}, -- Po
		{id = 182, poid = 30}, -- Invo
		{id = 112, poid = 20}, -- Do
		{id = 2804, poid = 15}, -- Do Per Di
		{id = 2800, poid = 15}, -- Do Per Mé
		--{id = 0, poid = 15}, -- Ré Per Di
		{id = 2803, poid = 15}, -- Ré Per Mé
		{id = 115, poid = 10}, -- Cri
		--{id = 0, poid = 10}, -- Do ren
		{id = 412, poid = 7}, -- Ret PM
		{id = 410, poid = 7}, -- Ret PA
		{id = 161, poid = 7}, -- Ré PM
		{id = 160, poid = 7}, -- Ré PA
		{id = 210, poid = 6}, -- Ré per terre
		{id = 211, poid = 6}, -- Ré per eau
		{id = 214, poid = 6}, -- Ré per neutre
		{id = 213, poid = 6}, -- Ré per feu
		{id = 212, poid = 6}, -- Ré per air
		{id = 422, poid = 5}, -- Do terre
		{id = 428, poid = 5}, -- Do air
		{id = 418, poid = 5}, -- Do cri
		{id = 753, poid = 4}, -- Tac
		{id = 752, poid = 4}, -- Fui
		{id = 176, poid = 3}, -- Prospe
		{id = 124, poid = 3}, -- Sa
		{id = 138, poid = 2}, -- Pui
		{id = 240, poid = 2}, -- Ré terre
		{id = 241, poid = 2}, -- Ré eau
		{id = 244, poid = 2}, -- Ré neutre
		{id = 243, poid = 2}, -- Ré feu
		{id = 242, poid = 2}, -- Ré air
		{id = 420, poid = 2}, -- Ré cri
		{id = 416, poid = 2}, -- Ré pou
		{id = 119, poid = 1}, -- Age
		{id = 125, poid = 0.2}, -- Vi
		{id = 174, poid = 0.1}, -- Ini
	}

	local poidSadi = {
		{id = 111, poid = 100}, -- PA
		{id = 128, poid = 90}, -- PM
		{id = 117, poid = 51}, -- Po
		{id = 182, poid = 30}, -- Invo
		{id = 112, poid = 20}, -- Do
		{id = 2804, poid = 15}, -- Do Per Di
		{id = 2800, poid = 15}, -- Do Per Mé
		--{id = 0, poid = 15}, -- Ré Per Di
		{id = 2803, poid = 15}, -- Ré Per Mé
		{id = 115, poid = 10}, -- Cri
		{id = 412, poid = 7}, -- Ret PM
		{id = 410, poid = 7}, -- Ret PA
		{id = 161, poid = 7}, -- Ré PM
		{id = 160, poid = 7}, -- Ré PA
		{id = 210, poid = 6}, -- Ré per terre
		{id = 211, poid = 6}, -- Ré per eau
		{id = 214, poid = 6}, -- Ré per neutre
		{id = 213, poid = 6}, -- Ré per feu
		{id = 212, poid = 6}, -- Ré per air
		{id = 422, poid = 5}, -- Do terre
		{id = 430, poid = 5}, -- Do neutre
		{id = 418, poid = 5}, -- Do cri
		{id = 753, poid = 4}, -- Tac
		{id = 752, poid = 4}, -- Fui
		{id = 176, poid = 3}, -- Prospe
		{id = 124, poid = 3}, -- Sa
		{id = 138, poid = 2}, -- Pui
		{id = 240, poid = 2}, -- Ré terre
		{id = 241, poid = 2}, -- Ré eau
		{id = 244, poid = 2}, -- Ré neutre
		{id = 243, poid = 2}, -- Ré feu
		{id = 242, poid = 2}, -- Ré air
		{id = 420, poid = 2}, -- Ré cri
		{id = 416, poid = 2}, -- Ré pou
		{id = 118, poid = 1}, -- Fo
		{id = 158, poid = 0.25}, -- Pod
		{id = 125, poid = 0.2}, -- Vi
		{id = 174, poid = 0.1}, -- Ini
	}

	local poidPanda = {
		{id = 111, poid = 100}, -- PA
		{id = 128, poid = 90}, -- PM
		{id = 117, poid = 51}, -- Po
		{id = 182, poid = 30}, -- Invo
		{id = 112, poid = 20}, -- Do
		{id = 2804, poid = 15}, -- Do Per Di
		{id = 2800, poid = 15}, -- Do Per Mé
		--{id = 0, poid = 15}, -- Ré Per Di
		{id = 2803, poid = 15}, -- Ré Per Mé
		{id = 115, poid = 10}, -- Cri
		{id = 412, poid = 7}, -- Ret PM
		{id = 410, poid = 7}, -- Ret PA
		{id = 161, poid = 7}, -- Ré PM
		{id = 160, poid = 7}, -- Ré PA
		{id = 210, poid = 6}, -- Ré per terre
		{id = 211, poid = 6}, -- Ré per eau
		{id = 214, poid = 6}, -- Ré per neutre
		{id = 213, poid = 6}, -- Ré per feu
		{id = 212, poid = 6}, -- Ré per air
		{id = 422, poid = 5}, -- Do terre
		{id = 430, poid = 5}, -- Do neutre
		{id = 418, poid = 5}, -- Do cri
		{id = 753, poid = 4}, -- Tac
		{id = 752, poid = 4}, -- Fui
		{id = 176, poid = 3}, -- Prospe
		{id = 124, poid = 3}, -- Sa
		{id = 138, poid = 2}, -- Pui
		{id = 240, poid = 2}, -- Ré terre
		{id = 241, poid = 2}, -- Ré eau
		{id = 244, poid = 2}, -- Ré neutre
		{id = 243, poid = 2}, -- Ré feu
		{id = 242, poid = 2}, -- Ré air
		{id = 420, poid = 2}, -- Ré cri
		{id = 416, poid = 2}, -- Ré pou
		{id = 118, poid = 1}, -- Fo
		{id = 158, poid = 0.25}, -- Pod
		{id = 125, poid = 0.2}, -- Vi
		{id = 174, poid = 0.1}, -- Ini
	}

	if character:breed() == 1 then	-- Feca
		return poidFeca
	elseif character:breed() == 3 then -- eni
		return poidEnu
	elseif character:breed() == 7 then -- eni
		return poidEni
	elseif character:breed() == 8 then -- Iop
		return poidIop
	elseif character:breed() == 9 then-- Cra
		return poidCra
	elseif character:breed() == 10 then -- Sadida
		return poidSadi
	elseif character:breed() == 11 then -- Sacri
		return poidSacri
	elseif character:breed() == 12 then-- Panda
		return poidPanda
	else
		printF.error("objectStuffPoid.lua -> La classe n'existe pas")
		return nil
	end
end

return objectStuffPoid
