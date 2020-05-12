--region Imports
coords = require(scriptPath() .. "mod/coords")
images = require(scriptPath() .. "mod/images")
configs = require(scriptPath() .. "mod/configs")
counter = require(scriptPath() .. "mod/counter")
status = require(scriptPath() .. "mod/status")
--endregion

local action = {}

--region Stamina Refill
---fill_stamina_click
---
---Click the type of the items to be consumed which is configured in `configs.lua`.
---
---Terminates the script if not handled to prevent wrong consumption.
function action.fill_stamina_click()
    if configs.stamina_fill_type == "Honey" then
        click(coords.stamina_honey_fill)
    else
        scriptExit(string.format("Unhandled stamina fill type: %s\nScript terminated.", configs.stamina_fill_type))
    end
end

---fill_stamina_honey
---
---Fill the stamina using honey with the configured count.
function action.fill_stamina_honey()
    for _ = 1, configs.stamina_fill_honey_count do
        click(coords.stamina_honey_add)
        wait(1)
    end
end
--endregion

---click_delay
---Click on ``location`` and then wait for ``delay`` seconds.
---
---@param location Location location to be clicked
---@param delay number seconds to wait
function action.click_delay(location, delay)
    click(location)

    if delay == nil then
        delay = configs.default_click_delay
    end
    wait(delay)
end

return action