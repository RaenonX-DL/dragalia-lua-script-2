configs = require(scriptPath() .. "mod/configs")

local images = {}

--region Quest Prepare
images.quest_main = {
    path = "quest-present.png";
    region = Region(764, 20, 69, 43);
}

images.quest_support = {
    path = "quest-solo.png";
    region = Region(211, 604, 86, 52);
}

images.quest_team = {
    path = "quest-start.png";
    region = Region(872, 2055, 91, 57);
}

--images.quest_team_dual = {
--    path = "quest-start-dual.png";
--    region = Region(0, 0, 0, 0);
--}
--endregion

--region Raid
--local banner_region = Region(0, 805, 1440, 1390)
--
--images.raid_banner_nrm = {
--    path = "raid-nrm.png";
--    region = Region(255, 825, 120, 1433);
--}
--
--images.raid_banner_ex = {
--    path = "raid-ex.png";
--    region = Region(504, 832, 64, 1410);
--}
--
--images.raid_banner_hell = {
--    path = "raid-hell.png";
--    region = banner_region;
--}
--
--images.raid_difficulty = {
--    path = "raid-diff.png";
--    region = Region(33, 596, 190, 75);
--}
--
--images.raid_multi_select = {
--    path = "raid-multi-sel.png";
--    region = Region(76, 603, 189, 69);
--}
--
--images.raid_multi_search = {
--    path = "raid-multi-search.png";
--    region = Region(711, 1452, 122, 68);
--}
--
--images.raid_create_room_id = {
--    path = "room-id.png";
--    region = Region(965, 1551, 59, 55);
--}
--
--images.raid_no_room = {
--    path = "rm-re-search.png";
--    region = Region(943, 1778, 177, 68);
--}
--
--images.raid_search_error = {
--    path = "close.png";
--    region = Region(601, 1768, 219, 87);
--}
--
--images.raid_in_room = {
--    path = "rm-leave.png";
--    region = Region(121, 2379, 120, 65);
--}
--
--images.raid_skip_and_start = {
--    path = "raid-start.png";
--    region = Region(923, 1780, 117, 66);
--}
--
--images.raid_host_left = {
--    path = "host-left.png";
--    region = Region(767, 1368, 120, 68);
--}
--
--images.raid_not_prepared = {
--    path = "rm-not-prep.png";
--    region = Region(1092, 2428, 108, 67);
--}
--endregion

--region In Game
images.in_game = {
    path = "in-game.png";
    region = Region(975, 33, 69, 58);
}

images.in_game_re = {
    path = "re-play.png";
    region = Region(714, 1377, 137, 58);
}

images.in_game_re_confirm = {
    path = "re-play.png";
    region = Region(711, 1410, 139, 56);
}
--endregion

--region Quest Clear
images.clear_next = {
    path = "clear-next.png";
    region = Region(760, 2216, 54, 59);
}

images.clear_level_up = {
    path = "clear-lvup.png";
    region = Region(0, 0, 50, 50);
}

images.clear_re = {
    path = "clear-re.png";
    region = Region(786, 1650, 93, 54);
}

images.clear_re_confirm = {
    path = "clear-re-confirm.png";
    region = Region(60, 742, 101, 60);
}

images.clear_no_continue = {
    path = "clear-ncont.png";
    region = Region(0, 0, 50, 50);
}

images.clear_weekly_bonus = {
    path = "weekly.png";
    region = Region(0, 0, 50, 50);
}
--endregion

--region Stamina Refill
images.stamina_fill = {
    path = "stamina-insuf.png";
    region = Region(281, 1562, 151, 59);
}

images.stamina_honey_fill = {
    path = "stamina-insuf.png";
    region = Region(282, 755, 118, 59);
}

images.stamina_use_diam = {
    path = "stamina-use-diam.png";
    region = Region(698, 1474, 98, 61);
}

images.stamina_honey_confirm = {
    path = "stamina-confirm.png";
    region = Region(692, 1413, 98, 57);
}
--endregion

--region Exceptional Cases
images.conn_error_retryable = {
    path = "retry.png";
    region = Region(0, 0, 50, 50);
}

images.conn_error_retryable = {
    path = "retry.png";
    region = Region(0, 0, 50, 50);
}

images.conn_error_not_retryable = {
    path = "err.png";
    region = Region(0, 0, 50, 50);
}

images.close_dialog = {
    path = "close.png";
    region = Region(0, 133, 1080, 1997);
}

-- Stricter dialog with close text detection
-- This excludes the text "close" during raid co-op room selection
images.close_dialog_strict = {
    path = "close.png";
    region = Region(0, 0, 50, 50);
}
--endregion

return images
