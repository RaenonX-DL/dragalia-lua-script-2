--region Imports
counter = require(scriptPath() .. "mod/counter")
checks = require(scriptPath() .. "mod/checks")
coords = require(scriptPath() .. "mod/coords")
status = require(scriptPath() .. "mod/status")
action = require(scriptPath() .. "mod/action")
sys = require(scriptPath() .. "mod/sys")
--endregion

while true do
    local current_status = status.get_current()

    if current_status == status.IN_GAME then
        counter.unlock()

        checks.conn_error_retryable()

        checks.in_game_re()
        checks.in_game_re_confirm()  -- After clicking confirmed, it's possible to immediately return to this status
        checks.clear()
        checks.clear_weekly_bonus()
        checks.close_dialog()

        -- Overtime
        if checks.prepare_main() then
            counter.count_fail()
        end
    elseif current_status == status.QUEST_MAIN then
        if not checks.prepare_support() then
            action.click_delay(coords.quest_click)
        end
    elseif current_status == status.QUEST_SUPPORT then
        if not checks.prepare_team() then
            action.click_delay(coords.quest_support)
        end
    elseif current_status == status.QUEST_TEAM then
        if not checks.in_game() and not checks.stamina_fill() then
            action.click_delay(coords.quest_start)
        end
    elseif current_status == status.IN_GAME_RE then
        counter.count_fail()

        if not checks.in_game_re_confirm() then
            action.click_delay(coords.in_game_re)
        end
    elseif current_status == status.IN_GAME_RE_CONFIRM then
        checks.in_game()
        action.click_delay(coords.in_game_re_confirm)
    elseif current_status == status.CLEAR then
        counter.count_pass()
        checks.close_dialog()

        if not checks.clear_re() then
            -- Prevent additional click if the next image is detected
            action.click_delay(coords.clear)
        end
    elseif current_status == status.CLEAR_RE then
        if not checks.clear_re_confirm() and not checks.stamina_fill() then
            action.click_delay(coords.clear_re)
        end
    elseif current_status == status.CLEAR_RE_CONFIRM then
        if not checks.in_game() then
            action.click_delay(coords.clear_re_confirm)
        end
        checks.conn_error_retryable()
    elseif current_status == status.STAMINA_FILL then
        if not checks.stamina_honey_fill() then
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
    elseif current_status == status.UNKNOWN then
        checks.in_game()
        checks.clear()
        checks.conn_error_retryable()
    else
        scriptExit(string.format("Unhandled state: %s\nScript terminated.", current_status))
    end

    sys.generate_toast()
end
