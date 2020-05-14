local coords = {}

--region Quest Prepare
coords.quest_click = Location(724, 1059)  -- Click the quest to play (the top most one)
coords.quest_support = Location(764, 1262)  -- Support at the top (so that if support unavailable will not click empty spot)
coords.quest_start = Location(1144, 2409)  -- Start the quest
--endregion

--region Raid
coords.banner_swipe1 = Location(720, 1600)  -- Starting point of the swiping to find the banner
coords.banner_swipe2 = Location(720, 1200)  -- Ending point of the swiping to find the banner

coords.difficulty_1 = Location(720, 1075)  -- Top most difficulty
coords.difficulty_2 = Location(720, 1486)  -- 2nd top most difficulty

coords.random_room = Location(720, 1630)  -- Random join room

coords.host_left = Location(720, 1810)  -- Room host left
--endregion

--region In Game
coords.in_game_re = Location(1044, 1739)  -- In game replay first dialog
coords.in_game_re_confirm = Location(1044, 1783)  -- In game replay second dialog

coords.in_game_normal_attack = Location(1101, 1560)  -- Coordinate to be clicked for normal in_game_normal_attack
coords.in_game_s1 = Location(513, 2545)  -- Coordinate of skill 1
coords.in_game_s2 = Location(798, 2545)  -- Coordinate of skill 2 (should NOT overlap with the `next` button when quest cleared)
--endregion

--region Quest Clear
coords.clear = Location(246, 2665)  -- "Replay" button when quest clear
coords.clear_level_up = Location(720, 2710)  -- Location to be clicked to dismiss "Level Up"
coords.clear_re = Location(1003, 2058)  -- "Replay" after clicking the button above
coords.clear_re_confirm = Location(1038, 1809)  -- Confirm quest replay

coords.clear_next = Location(1075, 2661)  -- "Next" button on quest clear
--endregion

--region Stamina Refill
coords.stamina_honey_fill = Location(750, 1745)  -- Fill stamina using honey (item type selection)
coords.stamina_honey_add = Location(1246, 1903)  -- "+" button to add honeys to consume / do not overlap consume
coords.stamina_honey_consume = Location(1032, 2167)  -- Click consume honey
coords.stamina_honey_confirm = Location(1022, 1784)  -- Confirm to consume honey
--endregion

--region Exceptional Cases
coords.conn_error_not_retryable = Location(720, 1812)  -- Close the connection error dialog
--endregion

return coords