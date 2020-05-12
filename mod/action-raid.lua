--region Imports
action = require(scriptPath() .. "mod/action")
coords = require(scriptPath() .. "mod/coords")
images = require(scriptPath() .. "mod/images")
configs = require(scriptPath() .. "mod/configs")
--endregion

local action_raid = {}

---get_raid_img_tbl
---
---Get the image table to be used to find the raid banner.
---
---Terminates the script if raid quest type unhandled (``configs.raid_quest`` improperly configured.
---
---@return table an image table corresponding to `configs.raid_quest`
local function get_raid_img_tbl()
    if configs.raid_quest == "Normal" then
        return images.raid_banner_nrm
    elseif configs.raid_quest == "EX" then
        return images.raid_banner_ex
    elseif configs.raid_quest == "Hell" then
        return images.raid_banner_hell
    else
        scriptExit(string.format("Raid quest type not handled: %s\n", configs.raid_quest))
    end
end

---check_raid_banner
---
---Check if the banner of the desired raid quest type has found.
---If found click on it and return ``True``. Otherwise, scroll down once and return ``False``.
---
---Set ``configs.raid_quest`` to choose between the quest types.
---
---@return boolean if the banner has found
function action_raid.check_raid_banner()
    setDragDropTiming(50, 50)
    setDragDropStepCount(80)
    setDragDropStepInterval(10)

    local img_tbl = get_raid_img_tbl()

    match_result = img_tbl.region:exists(img_tbl.path, 0.5)
    if match_result and match_result:getScore() > 0.9 then
        action.click_delay(match_result:getTarget())
        return true
    end

    dragDrop(coords.banner_swipe1, coords.banner_swipe2)
    return false
end

---click_raid_difficulty
---
---Click on the corresponding raid difficulty location.
---
---Set ``configs.raid_difficulty`` to choose between the difficulty position.
function action_raid.click_raid_difficulty()
    if configs.raid_difficulty == 1 then
        action.click_delay(coords.difficulty_1)
    elseif configs.raid_difficulty == 2 then
        action.click_delay(coords.difficulty_2)
    else
        scriptExit(string.format("Raid quest difficulty position not handled: %d\n", configs.raid_difficulty))
    end
end

return action_raid