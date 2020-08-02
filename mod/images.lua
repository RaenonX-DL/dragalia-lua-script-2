local images = {}

--region Quest Prepare
images.quest_main = {
    path = "quest-present.png";
    region = Region(1021, 109, 87, 54);
}

images.quest_support = {
    path = "quest-solo.png";
    region = Region(291, 858, 104, 60);
}

images.quest_team = {
    path = "quest-start.png";
    region = Region(1168, 2427, 112, 66);
}
--endregion

--region Raid
local banner_region = Region(0, 805, 1440, 1390)

images.raid_banner_nrm = {
    path = "raid-nrm.png";
    region = Region(316, 871, 121, 1139);
}

images.raid_banner_ex = {
    path = "raid-ex.png";
    region = Region(0, 788, 1440, 1271);
}

images.raid_banner_hell = {
    path = "raid-hell.png";
    region = banner_region;
}

images.raid_difficulty = {
    path = "raid-diff.png";
    region = Region(33, 596, 190, 75);
}

images.raid_multi_select = {
    path = "raid-multi-sel.png";
    region = Region(76, 603, 189, 69);
}

images.raid_multi_search = {
    path = "raid-multi-search.png";
    region = Region(711, 1452, 122, 68);
}

images.raid_no_room = {
    path = "rm-re-search.png";
    region = Region(943, 1778, 177, 68);
}

images.raid_search_error = {
    path = "close.png";
    region = Region(601, 1768, 219, 87);
}

images.raid_in_room = {
    path = "rm-leave.png";
    region = Region(121, 2379, 120, 65);
}

images.raid_host_left = {
    path = "host-left.png";
    region = Region(767, 1368, 120, 68);
}

images.raid_not_prepared = {
    path = "rm-not-prep.png";
    region = Region(1092, 2428, 108, 67);
}
--endregion

--region In Game
images.in_game = {
    path = "in-game.png";
    region = Region(1311, 138, 67, 53);
}

images.in_game_re = {
    path = "re-play.png";
    region = Region(948, 1707, 188, 73);
}

images.in_game_re_confirm = {
    path = "re-play.png";
    region = Region(929, 1731, 224, 110);
}
--endregion

--region Quest Clear
images.clear_next = {
    path = "clear-next.png";
    region = Region(1014, 2634, 67, 68);
}

images.clear_level_up = {
    path = "clear-lvup.png";
    region = Region(78, 336, 1286, 820);
}

images.clear_re = {
    path = "clear-re.png";
    region = Region(1052, 2059, 114, 71);
}

images.clear_re_confirm = {
    path = "clear-re-confirm.png";
    region = Region(83, 881, 131, 77);
}

images.clear_no_continue = {
    path = "clear-ncont.png";
    region = Region(261, 2209, 283, 67);
}

images.clear_weekly_bonus = {
    path = "weekly.png";
    region = Region(416, 1516, 250, 66);
}
--endregion

--region Stamina Refill
images.stamina_fill = {
    path = "stamina-insuf.png";
    region = Region(342, 1947, 286, 72);
}

images.stamina_honey_fill = {
    path = "stamina-insuf.png";
    region = Region(342, 898, 278, 77);
}

images.stamina_honey_confirm = {
    path = "stamina-confirm.png";
    region = Region(925, 1750, 128, 71);
}
--endregion

--region Exceptional Cases
images.conn_error_retryable = {
    path = "retry.png";
    region = Region(900, 1758, 272, 112);
}

images.conn_error_retryable = {
    path = "retry.png";
    region = Region(900, 1758, 272, 112);
}

images.conn_error_not_retryable = {
    path = "err.png";
    region = Region(767, 1365, 118, 71);
}

images.close_dialog = {
    path = "close.png";
    region = Region(0, 91, 1440, 2720);
}
--endregion

return images