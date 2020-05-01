local coords = {}

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