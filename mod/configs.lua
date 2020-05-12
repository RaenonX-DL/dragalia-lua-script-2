local configs = {}

--region System
configs.debug = true
--endregion

--region Toast
configs.toast_enable = true
configs.toast_cd_sec = 5
--endregion

--region Game
configs.stamina_fill_type = "Honey"  -- Honey / Diamantiums
configs.stamina_fill_honey_count = 3

configs.raid_quest = "Normal"  -- Normal / EX / Hell
configs.raid_difficulty = 1  -- 1 / 2 (Count from top starting from 1)
--endregion

--region Script
configs.default_click_delay = 1
--endregion

return configs