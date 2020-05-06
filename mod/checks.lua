--region Imports
base = require(scriptPath() .. "mod/base")
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
---Check: images.clear
---New Status: status.CLEAR
function checks.clear()
    return base.check_image(images.clear, status.CLEAR)
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
--endregion

return checks