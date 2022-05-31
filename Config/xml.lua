local xml = {}

function xml.getPathConfig()
	printF.debug("xml.lua", "getPathConfig()")

	local xmlPath = nil
	if tonumber(character:identifier()) ~= data.getIdHDV()
	and tonumber(character:identifier()) ~= data.getIdBANK()
	then
		if character:breed() == 1 then -- Feca
			xmlPath = "scripts\\Config\\xml\\IA_feca.xml"
			printF.success("La configuration [IA_feca.xml] est chargée !")
		elseif character:breed() == 3 then -- Enu
			xmlPath = "scripts\\Config\\xml\\IA_enu.xml"
			printF.success("La configuration [IA_enu.xml] est chargée !")
		elseif character:breed() == 7 then -- Eni
			xmlPath = "scripts\\Config\\xml\\IA_eni.xml"
			printF.success("La configuration [IA_eni.xml] est chargée !")
		elseif character:breed() == 8 then -- Iop
			xmlPath = "scripts\\Config\\xml\\IA_iop.xml"
			printF.success("La configuration [IA_iop.xml] est chargée !")
		elseif character:breed() == 9 then -- Cra
			xmlPath = "scripts\\Config\\xml\\IA_cra.xml"
			printF.success("La configuration [IA_cra.xml] est chargée !")
		elseif character:breed() == 10 then -- Sadida
			xmlPath = "scripts\\Config\\xml\\IA_sadi.xml"
			printF.success("La configuration [IA_sadi.xml] est chargée !")
		elseif character:breed() == 11 then -- Sacri
			xmlPath = "scripts\\Config\\xml\\IA_sacri.xml"
			printF.success("La configuration [IA_sacri.xml] est chargée !")
		elseif character:breed() == 12 then -- Panda
			xmlPath = "scripts\\Config\\xml\\IA_panda.xml"
			printF.success("La configuration [IA_panda.xml] est chargée !")
		end
	else
		xmlPath = "scripts\\Config\\xml\\IA_bank.xml"
		printF.success("La configuration [IA_bank.xml] est chargée !")
	end

	return xmlPath
end

return xml
