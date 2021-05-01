configs = require(scriptPath() .. "mod/configs")
utils = require(scriptPath() .. "mod/utils")

local coords = require(scriptPath() .. "mod/" .. configs.device .. "/coords")

-- Correct all locations before use
for name, location in pairs(coords) do
    coords[name] = utils.correct_location(location)
end

return coords
