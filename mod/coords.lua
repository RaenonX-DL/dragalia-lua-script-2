local coords = {}

--region Quest Prepare
coords.quest_click = Location(724, 1059)  -- Click the quest to play (the top most one)
coords.quest_support = Location(764, 1262)  -- Support at the top (so that if support unavailable will not click empty spot)
coords.quest_start = Location(1144, 2409)  -- Start the quest
--endregion

--region In Game
coords.in_game_re = Location(1044, 1739)  -- In game replay first dialog
coords.in_game_re_confirm = Location(1044, 1783)  -- In game replay second dialog
--endregion

--region Quest Clear
coords.clear = Location(246, 2665)  -- "Replay" button when quest clear
coords.clear_re = Location(1003, 2058)  -- "Replay" after clicking the button above
coords.clear_re_confirm = Location(1038, 1809)  -- Confirm quest replay
--endregion

--region Stamina Refill
coords.stamina_honey_fill = Location(750, 1745)  -- Fill stamina using honey (item type selection)
coords.stamina_honey_add = Location(1246, 1903)  -- "+" button to add honeys to consume / do not overlap consume
coords.stamina_honey_consume = Location(1032, 2167)  -- Click consume honey
coords.stamina_honey_confirm = Location(1022, 1784)  -- Confirm to consume honey
--endregion

return coords