local configs = {}

--region System
configs.debug = true
--endregion

--region Toast
configs.toast_enable = true
configs.toast_cd_sec = 5
--endregion

--region Game
configs.stamina_fill_type = "Gems"  -- Honey / Diamantiums / Gems
configs.stamina_fill_honey_count = 3
configs.stamina_fill_pos = 3  -- 1: Top / 2: Mid / 3: Bot

configs.total_games = 100

configs.raid_quest = "Normal"  -- Normal / EX / Hell
configs.raid_difficulty = 1  -- 1 / 2 (Count from top starting from 1)
--endregion

--region Script
configs.default_click_delay = 1
--endregion

return configs
