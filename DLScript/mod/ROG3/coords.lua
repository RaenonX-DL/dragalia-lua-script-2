local coords = {}

--region Quest Prepare
coords.quest_click_1 = Location(529, 843)  -- Click the quest to play (the top most one)
coords.quest_click_2 = Location(529, 1155)  -- Click the quest to play (the 2nd top most one)
coords.quest_support = Location(493, 801)  -- Support at the top (so that if support unavailable will not click empty spot)
coords.quest_start = Location(847, 2041)  -- Start the quest
--endregion

--region Raid
--coords.banner_swipe1 = Location(0, 0)  -- Starting point of the swiping to find the banner
--coords.banner_swipe2 = Location(0, 0)  -- Ending point of the swiping to find the banner
--
--coords.difficulty_1 = Location(0, 0)  -- Top most difficulty
--coords.difficulty_2 = Location(0, 0)  -- 2nd top most difficulty
--
--coords.random_room = Location(0, 0)  -- Random join room
--coords.create_room = Location(0, 0)  -- Create a room
--
--coords.host_left = Location(0, 0)  -- Room host left
--endregion

--region In Game
coords.in_game_re = Location(780, 1410)  -- In game replay first dialog
coords.in_game_re_confirm = Location(780, 1434)  -- In game replay second dialog

coords.in_game_normal_attack = Location(554, 1883)  -- Coordinate to be clicked for normal in_game_normal_attack
coords.in_game_s1 = Location(371, 2222)  -- Coordinate of skill 1
coords.in_game_s2 = Location(577, 2222)  -- Coordinate of skill 2 (should NOT overlap with the `next` button when quest cleared)
--endregion

--region Quest Clear
coords.clear = Location(184, 2245)  -- "Replay" button when quest clear
coords.clear_level_up = Location(561, 2041)  -- Location to be clicked to dismiss "Level Up"
coords.clear_re = Location(769, 1655)  -- "Replay" after clicking the button above
coords.clear_re_confirm = Location(778, 1457)  -- Confirm quest replay

coords.clear_next = Location(801, 2249)  -- "Next" button on quest clear

coords.clear_cancel_weekly = Location(0, 0)  -- "Cancel" button when asking if the weekly bonus should be claimed
--endregion

--region Stamina Refill
coords.stamina_honey_fill = Location(563, 1392)  -- Fill stamina using honey (item type selection)
coords.stamina_honey_add_1 = Location(937, 1002)  -- "+" button to add honeys to consume (top) / do not overlap consume
coords.stamina_honey_add_2 = Location(937, 1252)  -- "+" button to add honeys to consume (mid) / do not overlap consume
coords.stamina_honey_add_3 = Location(937, 1505)  -- "+" button to add honeys to consume (bot) / do not overlap consume
coords.stamina_honey_consume = Location(775, 1733)  -- Click consume honey
coords.stamina_honey_confirm = Location(775, 1437)  -- Confirm to consume honey

coords.stamina_diam_fill = Location(558, 876)  -- Fill stamina using diamantiums (item type selection)
coords.stamina_gem_fill = Location(558, 1139)  -- Fill stamina using wyrmites (item type selection)

coords.stamina_diam_gem_use = Location(782, 1502)  -- Fill stamina using diamantiums / wyrmites (click use)
--endregion

--region Exceptional Cases
coords.conn_error_not_retryable = Location(0, 0)  -- Close the connection error dialog
--endregion

return coords
