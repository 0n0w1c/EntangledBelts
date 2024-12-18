local belt_group =
{
    type = "item-subgroup",
    name = "belt-underground",
    group = "logistics",
    order = "bb"
}

data:extend({ belt_group })

local function clone_item(clone, original)
    local item = table.deepcopy(data.raw["item"][original])

    if item then
        item.name = clone
        item.place_result = clone
        item.subgroup = "belt-underground"
        item.order = data.raw["item"][original].order .. "z"
    end

    return item
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
