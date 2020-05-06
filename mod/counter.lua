--region Imports
logger = require(scriptPath() .. "mod/logger")
sys = require(scriptPath() .. "mod/sys")
--endregion

local counter = {}

local count_pass = 0
local count_fail = 0
local counter_lock = true

local csv_stream = io.open(scriptPath() .. "stats.csv", "a+")

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
        count_pass = count_pass + 1
        logger.log_message(
                string.format(
                        "[%s] Passed Once. New Counter Status: %s",
                        sys.get_current_datetime(), counter.get_formatted_text()))
        log_csv(true)
    end
    counter_lock = true
end

function counter.count_fail()
    if not counter_lock then
        count_fail = count_fail + 1
        logger.log_message(
                string.format(
                        "%s - Failed Once. New Counter Status: %s",
                        sys.get_current_datetime(), counter.get_formatted_text()))
        log_csv(false)
    end
    counter_lock = true
end

function counter.get_formatted_text()
    return string.format("%s / %s (%.2f%%)",
            counter.get_count_pass(),
            counter.get_count_total(),
            counter.get_pass_pct())
end

---log_csv
---
---Log a csv entry for stats.
---
---Only logs "0,1" (Failed) or "1,1" (Passed) so that the stats does not limited in a single run.
---
---@param passed boolean if the quest is passed
function log_csv(passed)
    if passed then
        csv_stream:write(string.format("%s,1,1\n", sys.get_current_datetime()))
    else
        csv_stream:write(string.format("%s,0,1\n", sys.get_current_datetime()))
    end
end
--endregion

return counter