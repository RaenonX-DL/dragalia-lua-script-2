--region Imports
configs = require(scriptPath() .. "mod/configs")
status = require(scriptPath() .. "mod/status")
--endregion

local base = {}

---check_image
---
---Check the image in the ``region`` with the image at ``path``.
---
---If found, update the status to be the ``new_status`` and execute ``true_func``.
---
---@param image_obj table `table` containing the image path and region to check
---@param new_status string new status if image found and this parameter is provided (not nil)
---@param true_func function function to execute if image found
---@return boolean if the image was found
function base.check_image(image_obj, new_status, true_func)
    if configs.debug then
        image_obj.region:highlight()
    end

    local found = false
    for _, m in ipairs(regionFindAllNoFindException(image_obj.region, image_obj.path)) do
        found = true

        if new_status ~= nil then
            status.update(new_status)
        end

        if true_func ~= nil then
            true_func(m)
        end
    end

    if configs.debug then
        image_obj.region:highlight()
    end

    return found
end

return base