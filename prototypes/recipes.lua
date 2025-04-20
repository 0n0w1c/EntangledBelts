local recipes = data.raw["recipe"]
local original_recipes = {}

for _, recipe in pairs(recipes) do
    table.insert(original_recipes, recipe)
end

for _, recipe in pairs(original_recipes) do
    if data.raw["underground-belt"][recipe.name] then
        recipe.subgroup = nil
        local eb_recipe = table.deepcopy(recipe)

        if eb_recipe and not recipe.hidden then
            eb_recipe.name = "eb-" .. recipe.name
            eb_recipe.category = nil
            eb_recipe.always_show_made_in = false
            eb_recipe.energy_required = 0.5
            eb_recipe.ingredients = { { type = "item", name = recipe.name, amount = 2 } }
            eb_recipe.results = { { type = "item", name = "eb-" .. recipe.name, amount = 2 } }
            if recipe.localised_name then
                eb_recipe.localised_name =
                {
                    "",
                    "[virtual-signal=entangled-belts] ",
                    recipe.localised_name or { "entity-name." .. recipe.name }
                }
            end

            eb_recipe.main_product = nil
            eb_recipe.surface_conditions = nil

            if recipe.order then
                eb_recipe.order = recipe.order .. "z"
            end
        end

        data.extend({ eb_recipe })
    end
end
