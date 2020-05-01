--region Imports
logger = require(scriptPath() .. "mod/logger")
--endregion

local counter = {}

local count_pass = 0
local count_fail = 0
local counter_lock = true

--region Accessors
function counter.get_count_pass()
    return count_pass
end

function counter.get_count_fail()
    return count_fail
end

function counter.get_count_total()
    return count_pass + count_fail
end

function counter.get_pass_pct()
    return count_pass / (count_pass + count_fail) * 100
end
--endregion

--region Utils
function counter.unlock()
    counter_lock = false
end

function counter.count_pass()
    if not counter_lock then
        logger.log_message(
                string.format(
                        "%s - Passed Once. New Counter Status: %s\n",
                        os.date("%c"), counter.get_formatted_text()))
        count_pass = count_pass + 1
    end
    counter_lock = true
end

function counter.count_fail()
    if not counter_lock then
        logger.log_message(
                string.format(
                        "%s - Failed Once. New Counter Status: %s\n",
                        os.date("%c"), counter.get_formatted_text()))
        count_fail = count_fail + 1
    end
    counter_lock = true
end

function counter.get_formatted_text()
    return string.format("%s / %s (%.2f%%)",
            counter.get_count_pass(),
            counter.get_count_total(),
            counter.get_pass_pct())
end
--endregion

return counter