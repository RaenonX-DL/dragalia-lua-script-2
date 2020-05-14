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
        if not checks.raid_multi_search() then
            action.click_delay(coords.random_room)
        end
        checks.raid_search_error()
    elseif current_status == status.RAID_MULTI_SEARCH then
        checks.raid_in_room()
        checks.raid_search_error()
        checks.raid_no_room()

        -- Fast-skip host (not waiting members to ready)
        checks.in_game()
    elseif current_status == status.RAID_IN_ROOM then
        checks.raid_not_prepared()
        checks.raid_host_left()
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
    elseif current_status == status.UNKNOWN then
        checks.prepare_main()
    else
        scriptExit(string.format("Unhandled state: %s\nScript terminated.", current_status))
    end

    sys.generate_toast()
end
