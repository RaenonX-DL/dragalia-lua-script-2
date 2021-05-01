configs = require(scriptPath() .. "mod/configs")
utils = require(scriptPath() .. "mod/utils")

local images = require(scriptPath() .. "mod/" .. configs.device .. "/images")

for name, image in pairs(images) do
    -- Append parent directory
    images[name].path = configs.device .. "/" .. image.path
    -- Correct all regions before use
    images[name].region = utils.correct_region(image.region)
end

return images
