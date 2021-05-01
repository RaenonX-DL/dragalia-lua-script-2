local configs = {}

--region System
configs.debug = true
--endregion

--region Toast
configs.toast_enable = true
configs.toast_cd_sec = 5
--endregion

--region Game
configs.devices = {
    "S9",
    "ROG3"
}

configs.stamina_fill_types = {
    "Honey",
    "Diamantiums",
    "Wyrmites",
}

configs.raid_quests = {
    "Normal",
    "EX",
    "Hell"
}
--endregion

--region Script
configs.default_click_delay = 1
--endregion

--region Functions
local function add_radio_buttons(tbl)
    for idx, quest in ipairs(tbl) do
        if quest == "--Row--" then
            newRow()
        else
            addRadioButton(quest, idx)
        end
    end
end

local function show_quest_config_dialog()
    dialogInit()

    -- Device
    newRow()
    addTextView("Device: ")
    addRelativeRadioGroup("config_device_idx", 1, 2)
    add_radio_buttons(configs.devices)

    -- Play Count
    newRow()
    addTextView("Play count: ")
    addEditNumber("config_total_games", 100)

    -- Quest Position
    newRow()
    addTextView("Quest Position: ")
    addEditNumber("config_quest_pos", 1)

    -- Quest Dual Party
    newRow()
    addCheckBox("config_quest_dual_party", "Dual Party", false)

    -- Stamina Refill Type
    newRow()
    addTextView("AP Refill Type: ")
    addRelativeRadioGroup("config_fill_type_idx", 1, 3)
    add_radio_buttons(configs.stamina_fill_types)

    -- Stamina Honey Count
    newRow()
    addTextView("AP Refill honey count: ")
    addEditNumber("config_honey_count", 4)

    -- Stamina Honey Position
    newRow()
    addTextView("AP Refill honey position: ")
    addEditNumber("config_honey_pos", 1)

    -- Raid Quest
    newRow()
    addTextView("Raid Quest: ")
    addRelativeRadioGroup("config_raid_idx", 1, 3)
    add_radio_buttons(configs.raid_quests)

    -- Raid Difficulty
    newRow()
    addTextView("Raid Difficulty: ")
    addEditNumber("config_raid_difficulty", 2)

    dialogShowFullScreen("Config")
end

local function load_config_data()
    configs.device = configs.devices[config_device_idx]

    configs.total_games = config_total_games
    configs.quest_pos = config_quest_pos
    configs.quest_dual_party = config_quest_dual_party

    configs.stamina_fill_type = configs.stamina_fill_types[config_fill_type_idx]
    configs.stamina_fill_honey_count = config_honey_count
    configs.stamina_fill_pos = config_honey_pos

    configs.raid_quest = configs.raid_quests[config_raid_idx]
    configs.raid_difficulty = config_raid_difficulty

    if configs.device == "ROG3" then
        -- Enables the control in the navbar area
        setImmersiveMode(true)
    end
end

show_quest_config_dialog()
load_config_data()
--endregion

return configs
