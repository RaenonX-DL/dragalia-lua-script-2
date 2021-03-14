--region Imports
base = require(scriptPath() .. "mod/base")
coords = require(scriptPath() .. "mod/coords")
images = require(scriptPath() .. "mod/images")
status = require(scriptPath() .. "mod/status")
action = require(scriptPath() .. "mod/action")
--endregion

local checks = {}

--region Quest Prepare
---prepare_main
---
---Check: images.quest_main
---New Status: status.QUEST_MAIN
function checks.prepare_main()
    return base.check_image(images.quest_main, status.QUEST_MAIN)
end

---prepare_support
---
---Check: images.quest_support
---New Status: status.QUEST_SUPPORT
function checks.prepare_support()
    return base.check_image(images.quest_support, status.QUEST_SUPPORT)
end

---prepare_team
---
---Check: images.quest_team
---New Status: status.QUEST_TEAM
function checks.prepare_team()
    return base.check_image(images.quest_team, status.QUEST_TEAM)
end

---prepare_team_dual
---
---Check: images.quest_team_dual
---New Status: status.QUEST_TEAM
function checks.prepare_team_dual()
    return base.check_image(images.quest_team_dual, status.IN_GAME, function(loc)
        click(loc)
    end)
end
--endregion

--region Raid
---raid_difficulty
---
---Check: images.raid_difficulty
---New Status: status.RAID_DFCT
function checks.raid_difficulty()
    return base.check_image(images.raid_difficulty, status.RAID_DFCT)
end

---raid_multi_select
---
---Check: images.raid_multi_select
---New Status: status.RAID_MULTI
function checks.raid_multi_select()
    return base.check_image(images.raid_multi_select, status.RAID_MULTI)
end

---raid_multi_search
---
---Check: images.raid_multi_search
---New Status: status.RAID_MULTI_SEARCH
function checks.raid_multi_search()
    return base.check_image(images.raid_multi_search, status.RAID_MULTI_SEARCH)
end

---raid_create_room_id
---
---Check: images.raid_create_room_id
---New Status: status.RAID_MULTI_CREATE_ID
function checks.raid_create_room_id()
    return base.check_image(images.raid_create_room_id, status.RAID_MULTI_CREATE_ID, function(loc)
        click(loc)
    end)
end

---raid_no_room
---
---Check: images.raid_no_room
---New Status: status.RAID_MULTI_SEARCH
function checks.raid_no_room()
    return base.check_image(images.raid_no_room, status.RAID_MULTI_SEARCH, function(loc)
        click(loc)
    end)
end

---raid_search_error
---
---Click on "Close" if any error dialog popped up when searching the rooms
---and update the current status to ``status.RAID_MULTI``.
---
---Currently known possible errors:
---
---- 3007: Connection Error
---
---Check: images.raid_search_error
---New Status: status.RAID_MULTI
function checks.raid_search_error()
    return base.check_image(images.raid_search_error, status.RAID_MULTI, function(loc)
        click(loc)
    end)
end

---raid_in_room
---
---Check: images.raid_in_room
---New Status: status.RAID_IN_ROOM
function checks.raid_in_room()
    return base.check_image(images.raid_in_room, status.RAID_IN_ROOM)
end

---raid_host_left
---
---Check: images.raid_host_left
---New Status: status.QUEST_MAIN
function checks.raid_host_left()
    return base.check_image(images.raid_host_left, status.QUEST_MAIN, function()
        click(coords.host_left)
    end)
end

---raid_skip_and_start
---
---Check: images.raid_skip_and_start
---New Status: status.RAID_IN_ROOM_STARTED
function checks.raid_skip_and_start()
    return base.check_image(images.raid_skip_and_start, status.RAID_IN_ROOM_STARTED, function(loc)
        click(loc)
    end)
end

---raid_not_prepared
---
---Click on the "Prepare" button if it seems not prepared.
---
---Check: images.raid_not_prepared
---New Status: (original status)
function checks.raid_not_prepared()
    return base.check_image(images.raid_not_prepared, status.get_current(), function(loc)
        click(loc)
    end)
end
--endregion

--region In Game
---in_game
---
---Check: images.in_game
---New Status: status.IN_GAME_RE
function checks.in_game()
    return base.check_image(images.in_game, status.IN_GAME)
end

---in_game_re
---
---Check: images.in_game_re
---New Status: status.IN_GAME_RE
function checks.in_game_re()
    return base.check_image(images.in_game_re, status.IN_GAME_RE)
end

---in_game_re_confirm
---
---Check: images.in_game_re_confirm
---New Status: status.IN_GAME_RE_CONFIRM
function checks.in_game_re_confirm()
    return base.check_image(images.in_game_re_confirm, status.IN_GAME_RE_CONFIRM)
end
--endregion

--region Quest Clear
---clear
---
---Check: images.clear_next
---New Status: status.CLEAR
function checks.clear()
    return base.check_image(images.clear_next, status.CLEAR)
end

---clear_level_up
---
---If "Level Up" is seen, click at the bottom of the screen to dismiss it.
---
---Check: images.clear_next
---New Status: status.CLEAR
function checks.clear_level_up()
    return base.check_image(images.clear_level_up, status.CLEAR, function()
        click(coords.clear_level_up)
    end)
end

---clear_re
---
---Check: images.clear_re
---New Status: status.CLEAR_RE
function checks.clear_re()
    return base.check_image(images.clear_re, status.CLEAR_RE)
end

---clear_re_confirm
---
---Check: images.clear_re_confirm
---New Status: status.CLEAR_RE_CONFIRM
function checks.clear_re_confirm()
    return base.check_image(images.clear_re_confirm, status.CLEAR_RE_CONFIRM)
end

---clear_next
---
---Click on "Next" and set the status to ``new_status`` or (original status).
---
---Check: images.clear_next
---New Status: ``new_status`` or (original status)
function checks.clear_next(new_status)
    return base.check_image(images.clear_next, new_status or status.get_current(), function (loc)
        click(loc)
    end)
end

---clear_no_continue
---
---Click on "No continue" and set the status to (original status).
---
---Check: images.clear_no_continue
---New Status: (original status)
function checks.clear_no_continue()
    return base.check_image(images.clear_no_continue, status.get_current(), function (loc)
        click(loc)
    end)
end

---clear_weekly_bonus
---
---Click on "Cancel" when seeing the dialog of claiming the weekly bonus.
---
---Check: images.clear_weekly_bonus
---New Status: status.CLEAR
function checks.clear_weekly_bonus()
    return base.check_image(images.clear_weekly_bonus, status.CLEAR, function ()
        click(coords.clear_cancel_weekly)
    end)
end
--endregion

--region Stamina Refill
---stamina_fill
---
---Check: images.stamina_fill
---New Status: status.STAMINA_FILL
function checks.stamina_fill()
    return base.check_image(images.stamina_fill, status.STAMINA_FILL)
end

---stamina_fill_honey
---
---Check: images.stamina_honey_fill
---New Status: status.STAMINA_HONEY_FILL
function checks.stamina_honey_fill()
    return base.check_image(images.stamina_honey_fill, status.STAMINA_HONEY_FILL)
end

---stamina_diam_gem_fill
---
---Check: images.stamina_use_diam
---New Status: status.STAMINA_DIAM_GEM_FILL
function checks.stamina_diam_gem_fill()
    return base.check_image(images.stamina_use_diam, status.STAMINA_DIAM_GEM_FILL)
end

---stamina_honey_confirm
---
---Check: images.stamina_honey_confirm
---New Status: status.STAMINA_HONEY_CONFIRM
function checks.stamina_honey_confirm()
    return base.check_image(images.stamina_honey_confirm, status.STAMINA_HONEY_CONFIRM)
end
--endregion

--region Exceptional Cases
---conn_error_retryable
---
---Click "Retry" when detected a connection error
---
---Check: images.conn_error_retryable
---New Status: (original status)
function checks.conn_error_retryable()
    return base.check_image(images.conn_error_retryable, status.get_current(), function(loc)
        click(loc)
    end)
end

---conn_error_not_retryable
---
---Click "Close" when detected a NON_RETRYABLE connection error
---
---Check: images.conn_error_not_retryable
---New Status: new_status or (original status)
function checks.conn_error_not_retryable(new_status)
    return base.check_image(images.conn_error_not_retryable, new_status or status.get_current(), function()
        click(coords.conn_error_not_retryable)
    end)
end

---close_dialog
---
---Click "Close" whenever a dialog is found and set the status to ``new_status`` or (original status).
---
---Check: images.close_dialog
---New Status: ``new_status`` or (original status)
---
---@param new_status string new status after closing the dialog
function checks.close_dialog(new_status)
    return base.check_image(images.close_dialog, new_status or status.get_current(), function(loc)
        click(loc)
    end)
end
--endregion

---close_dialog_strict
---
---Click "Close" whenever a dialog is found and set the status to ``new_status`` or (original status).
---
---This is stricter than `checks.close_dialog()`
---
---Check: images.close_dialog_strict
---New Status: ``new_status`` or (original status)
---
---@param new_status string new status after closing the dialog
function checks.close_dialog_strict(new_status)
    return base.check_image(images.close_dialog_strict, new_status or status.get_current(), function(loc)
        click(loc)
    end)
end
--endregion

return checks
