local image = {}

--region Quest Prepare
image.quest_main = {
    path = "quest-present.png";
    region = Region(1021, 109, 87, 54);
}

image.quest_support = {
    path = "quest-solo.png";
    region = Region(291, 858, 104, 60);
}

image.quest_team = {
    path = "quest-start.png";
    region = Region(1168, 2427, 112, 66);
}
--endregion

--region In Game
image.in_game = {
    path = "in-game.png";
    region = Region(1311, 138, 67, 53);
}

image.in_game_re = {
    path = "re-play.png";
    region = Region(948, 1707, 188, 73);
}

image.in_game_re_confirm = {
    path = "re-play.png";
    region = Region(929, 1731, 224, 110);
}
--endregion

--region Quest Clear
image.clear = {
    path = "clear-next.png";
    region = Region(1012, 2632, 130, 71);
}

image.clear_re = {
    path = "clear-re.png";
    region = Region(1052, 2059, 114, 71);
}

image.clear_re_confirm = {
    path = "clear-re-confirm.png";
    region = Region(83, 881, 131, 77);
}
--endregion

--region Stamina Refill
image.stamina_fill = {
    path = "stamina-insuf.png";
    region = Region(342, 1947, 286, 72);
}

image.stamina_honey_fill = {
    path = "stamina-insuf.png";
    region = Region(342, 898, 278, 77);
}

image.stamina_honey_confirm = {
    path = "stamina-confirm.png";
    region = Region(925, 1750, 128, 71);
}
--endregion

--region Exceptional Cases
image.conn_error_retryable = {
    path = "retry.png";
    region = Region(900, 1758, 272, 112);
}
--endregion

return image