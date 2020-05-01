local logger = {}

log_stream = io.open(scriptPath() .. "log.txt", "a+")

function logger.log_message(message)
	log_stream:write(message)
end

function logger.screenshot_message(message)
	screenshot_message_file_suffix(message, "")
end

function logger.screenshot_message_file_suffix(message, file_suffix)
	setImagePath(scriptPath() .. "image/log")

	fileName = string.format("%s-%s.png", os.date("%y%m%d-%H%M%S"), file_suffix)

	log_stream:write(string.format("Screenshot saved at %s. Message: %s", fileName, message))
	log_stream:write(message)

	screen = getAppUsableScreenSize()
	reg = Region(0, 0, screen:getX(), screen:getY())
	reg:save(fileName)

	setImagePath(scriptPath() .. "image")
end

--region Initialize
logger.log_message("\n===============\n")
logger.log_message(os.date("Starts at %c\n"))
--endregion

return logger