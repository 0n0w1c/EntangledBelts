local function clone_recipe(clone, original)
    local recipe = table.deepcopy(data.raw["recipe"][original])

    if recipe then
        recipe.name = clone
        recipe.category = nil
        recipe.always_show_made_in = false
        recipe.energy_required = 0.5
        recipe.ingredients = { { type = "item", name = original, amount = 2 } }
        recipe.results = { { type = "item", name = clone, amount = 2 } }
    end

    return recipe
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
