local objectChat = {}

function objectChat.goStuff_MP()
	printF.debug("objectChat.lua", "goStuff_MP()")

	local message = "ok"

	if character:breed() == 1 then
		message = "feca"
	elseif character:breed() == 3 then
		message = "enu"
	elseif character:breed() == 7 then
		message = "eni"
	elseif character:breed() == 8 then
		message = "iop"
	elseif character:breed() == 9 then
		message = "cra"
	elseif character:breed() == 10 then
		message = "sacri"
	elseif character:breed() == 11 then
		message = "sadi"
	elseif character:breed() == 12 then
		message = "panda"
	end

	return message
end

return objectChat
