local function clone_item(clone_name, original)
    local clone = table.deepcopy(data.raw["item"][original])
    if clone then
        clone.name = clone_name
        clone.place_result = clone_name
        clone.order = data.raw["item"][original].order .. "z"
    end
    return clone
end

local entangled_belt = clone_item("entangled-belt", "underground-belt")
local fast_entangled_belt = clone_item("fast-entangled-belt", "fast-underground-belt")
local express_entangled_belt = clone_item("express-entangled-belt", "express-underground-belt")

if entangled_belt and fast_entangled_belt and express_entangled_belt then
    data:extend { entangled_belt, fast_entangled_belt, express_entangled_belt }
end

if mods["space-age"] then
    local turbo_entangled_belt = clone_item("turbo-entangled-belt", "turbo-underground-belt")

    if turbo_entangled_belt then
        data:extend { turbo_entangled_belt }
    end
end