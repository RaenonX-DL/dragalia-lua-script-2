--region Imports
counter = require(scriptPath() .. "mod/counter")
checks = require(scriptPath() .. "mod/checks")
coords = require(scriptPath() .. "mod/coords")
status = require(scriptPath() .. "mod/status")
action = require(scriptPath() .. "mod/action")
action_raid = require(scriptPath() .. "mod/action-raid")
sys = require(scriptPath() .. "mod/sys")
--endregion

while true do
    local current_status = status.get_current()

    if current_status == status.QUEST_MAIN then
        if action_raid.check_raid_banner() then
            checks.raid_difficulty()
        end
    elseif current_status == status.RAID_DFCT then
        if not checks.raid_multi_select() then
            action_raid.click_raid_difficulty()
        end
    elseif current_status == status.RAID_MULTI then
        action.click_delay(coords.create_room)
        checks.raid_create_room_id()
    elseif current_status == status.RAID_MULTI then
        action.click_delay(coords.create_room)
        checks.raid_create_room_id()
    elseif current_status == status.RAID_MULTI_CREATE_ID then
        checks.raid_in_room()
        checks.stamina_fill()
        checks.close_dialog_strict(status.RAID_MULTI)
    elseif current_status == status.RAID_IN_ROOM then
        action.click_delay(coords.quest_start)
        checks.raid_skip_and_start()
    elseif current_status == status.RAID_IN_ROOM_STARTED then
        checks.in_game()

		checks.conn_error_not_retryable(status.QUEST_MAIN)
        checks.conn_error_retryable()
    elseif current_status == status.IN_GAME then
        counter.unlock()

        action_raid.in_battle()

        checks.clear_level_up()
        checks.close_dialog(status.CLEAR)
        checks.clear()
        checks.conn_error_retryable()
    elseif current_status == status.CLEAR then
        counter.count_pass()

        checks.clear_next()
        checks.clear_no_continue()
        checks.close_dialog()
        checks.prepare_main()
        checks.conn_error_retryable()
    elseif current_status == status.STAMINA_FILL then
        if not action.stamina_check_item_fill() then
            action.fill_stamina_click()
        end
    elseif current_status == status.STAMINA_HONEY_FILL then
        if not checks.stamina_honey_confirm() then
            action.fill_stamina_honey()
            action.click_delay(coords.stamina_honey_consume)
        end
    elseif current_status == status.STAMINA_HONEY_CONFIRM then
        if not checks.in_game() then
            action.click_delay(coords.stamina_honey_confirm)
        end
        checks.conn_error_retryable()
    elseif current_status == status.STAMINA_DIAM_GEM_FILL then
        if not checks.in_game() or not checks.raid_multi_search() or not checks.raid_in_room() then
            action.click_delay(coords.stamina_diam_gem_use)
			status.update(status.RAID_IN_ROOM)
        end
    elseif current_status == status.UNKNOWN then
        checks.prepare_main()
        checks.clear()
        checks.close_dialog()
    else
        scriptExit(string.format("Unhandled state: %s\nScript terminated.", current_status))
    end

    sys.generate_toast()
end
