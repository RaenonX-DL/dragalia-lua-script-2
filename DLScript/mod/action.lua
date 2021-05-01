--region Imports
coords = require(scriptPath() .. "mod/coords")
images = require(scriptPath() .. "mod/images")
configs = require(scriptPath() .. "mod/configs")
counter = require(scriptPath() .. "mod/counter")
status = require(scriptPath() .. "mod/status")
--endregion

local action = {}

function action.click_quest()
    if configs.quest_pos == 1 then
        action.click_delay(coords.quest_click_1)
    elseif configs.quest_pos == 2 then
        action.click_delay(coords.quest_click_2)
    else
        scriptExit(string.format("Unhandled quest click position: %d\nScript terminated.", configs.quest_pos))
    end
end

--region Stamina Refill

function action.stamina_check_item_fill()
    if configs.stamina_fill_type == "Honey" then
        return checks.stamina_honey_fill()
    elseif configs.stamina_fill_type == "Diamantiums" or configs.stamina_fill_type == "Wyrmites" then
        return checks.stamina_diam_gem_fill()
    else
        scriptExit(string.format("Unhandled stamina fill type: %s\nScript terminated.", configs.stamina_fill_type))
    end
end


---fill_stamina_click
---
---Click the type of the items to be consumed which is configured in `configs.lua`.
---
---Terminates the script if not handled to prevent wrong consumption.
function action.fill_stamina_click()
    if configs.stamina_fill_type == "Honey" then
        click(coords.stamina_honey_fill)
    elseif configs.stamina_fill_type == "Diamantiums" then
        click(coords.stamina_diam_fill)
    elseif configs.stamina_fill_type == "Wyrmites" then
        click(coords.stamina_gem_fill)
    else
        scriptExit(string.format("Unhandled stamina fill type: %s\nScript terminated.", configs.stamina_fill_type))
    end
end

---fill_stamina_honey
---
---Fill the stamina using honey with the configured count.
function action.fill_stamina_honey()
    local click_coord
    if configs.stamina_fill_pos == 1 then
        click_coord = coords.stamina_honey_add_1
    elseif configs.stamina_fill_pos == 2 then
        click_coord = coords.stamina_honey_add_2
    elseif configs.stamina_fill_pos == 3 then
        click_coord = coords.stamina_honey_add_3
    else
        scriptExit(string.format("Unknown stamina fill position: %d\nScript terminated.", configs.stamina_fill_pos))
    end

    for _ = 1, configs.stamina_fill_honey_count do
        click(click_coord)
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
