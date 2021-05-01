local status = {}

--region States
status.UNKNOWN = "Unknown"
status.QUEST_MAIN = "Quest / Main"
status.QUEST_SUPPORT = "Quest / Support"
status.QUEST_TEAM = "Quest / Team"
status.RAID_DFCT = "Raid / Difficulty"
status.RAID_MULTI = "Raid / Multi"
status.RAID_MULTI_SEARCH = "Raid / Multi (Search)"
status.RAID_MULTI_CREATE_ID = "Raid / Multi (Create)"
status.RAID_IN_ROOM = "Raid / In Room"
status.RAID_IN_ROOM_STARTED = "Raid / In Room (Started)"
status.IN_GAME = "Game"
status.IN_GAME_RE = "Game / Re"
status.IN_GAME_RE_CONFIRM = "Game / Re-Confirm"
status.CLEAR = "Clear"
status.CLEAR_RE = "Clear / Re"
status.CLEAR_RE_CONFIRM = "Clear / Re-Confirm"
status.STAMINA_FILL = "Stamina / Fill"
status.STAMINA_DIAM_GEM_FILL = "Stamina / DiamsGems"
status.STAMINA_HONEY_FILL = "Stamina / Honey"
status.STAMINA_HONEY_CONFIRM = "Stamina / Honey-Confirm"
--endregion

--region Functions
previous = status.UNKNOWN
current = status.UNKNOWN

function status.get_current()
    return current
end

function status.get_previous()
    return previous
end

function status.update(new_state)
    previous = current
    current = new_state
end
--endregion

return status
