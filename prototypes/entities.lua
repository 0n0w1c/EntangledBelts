local function clone_entity(clone_name, original, upgrade)
    local clone = table.deepcopy(data.raw["underground-belt"][original])
    if clone then
        clone.name = clone_name
        clone.next_upgrade = upgrade
        clone.minable.result = original
    end
    return clone
end

local express_upgrade = nil
if mods["space-age"] then express_upgrade = "turbo-entangled-belt" end

local entangled_belt = clone_entity("entangled-belt", "underground-belt", "fast-entangled-belt")
local fast_entangled_belt = clone_entity("fast-entangled-belt", "fast-underground-belt", "express-entangled-belt")
local express_entangled_belt = clone_entity("express-entangled-belt", "express-underground-belt", express_upgrade)

if entangled_belt and fast_entangled_belt and express_entangled_belt then
    data:extend { entangled_belt, fast_entangled_belt, express_entangled_belt }
end

if mods["space-age"] then
    local turbo_entangled_belt = clone_entity("turbo-entangled-belt", "turbo-underground-belt", nil)

    if turbo_entangled_belt then
        data:extend { turbo_entangled_belt }
    end
end
