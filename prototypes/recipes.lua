local function clone_recipe(clone_name, original_name)
    local clone = table.deepcopy(data.raw["recipe"][original_name])
    if clone then
        clone.name = clone_name
        clone.category = nil
        clone.always_show_made_in = false
        clone.energy_required = 0.5
        clone.ingredients = { { type = "item", name = original_name, amount = 2 } }
        clone.results = { { type = "item", name = clone_name, amount = 2 } }
    end
    return clone
end

local entangled_belt = clone_recipe("entangled-belt", "underground-belt")
local fast_entangled_belt = clone_recipe("fast-entangled-belt", "fast-underground-belt")
local express_entangled_belt = clone_recipe("express-entangled-belt", "express-underground-belt")

if entangled_belt and fast_entangled_belt and express_entangled_belt then
    data:extend { entangled_belt, fast_entangled_belt, express_entangled_belt }
end

if mods["space-age"] then
    local turbo_entangled_belt = clone_recipe("turbo-entangled-belt", "turbo-underground-belt")

    if turbo_entangled_belt then
        data:extend { turbo_entangled_belt }
    end
end
