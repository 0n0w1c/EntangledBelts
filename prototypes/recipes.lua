local recycling = {}
if mods["quality"] then
    recycling = require("__quality__/prototypes/recycling")
end

local original_recipes = {}

for _, recipe in pairs(data.raw["recipe"]) do
    local item = data.raw["item"][recipe.name]

    if item
        and item.place_result
        and data.raw["underground-belt"][item.place_result]
        and not recipe.hidden
    then
        original_recipes[#original_recipes + 1] = recipe
    end
end

for _, recipe in pairs(original_recipes) do
    recipe.subgroup = nil

    local eb_recipe = table.deepcopy(recipe)

    eb_recipe.name = "eb-" .. recipe.name
    eb_recipe.main_product = eb_recipe.name
    eb_recipe.surface_conditions = nil
    eb_recipe.result = nil

    if settings.startup["eb-make-traditional"].value then
        eb_recipe.results = {
            { type = "item", name = eb_recipe.name, amount = 2 }
        }
    else
        eb_recipe.category = nil
        eb_recipe.always_show_made_in = false
        eb_recipe.energy_required = 0.5
        eb_recipe.ingredients = {
            { type = "item", name = recipe.name, amount = 2 }
        }
        eb_recipe.results = {
            { type = "item", name = eb_recipe.name, amount = 2 }
        }
    end

    eb_recipe.icon = nil
    eb_recipe.icon_size = nil

    local eb_item = data.raw["item"][eb_recipe.name]
    eb_recipe.icons = table.deepcopy(eb_item.icons)
    eb_recipe.order = (eb_item.order or "") .. "z"

    eb_recipe.localised_name = {
        "",
        "[virtual-signal=entangled-belts]",
        { "entity-name." .. recipe.name }
    }

    data:extend({ eb_recipe })

    -- Allow recycling for all generated eb recipes.
    -- Quality mod special case:
    -- The recycling generator blocks most "metallurgy" recipes unless they are explicitly whitelisted
    -- (e.g. turbo belts in vanilla). Our "eb-*" variants do not match that whitelist, so they would
    -- normally be skipped and never get recycling recipes.
    --
    -- To work around this, we pass a custom filter function that re-allows our specific recipe.
    -- Non-metallurgy recipes are unaffected and always allowed.
    --
    -- Yes, this is hacky, but it's the intended extension point of generate_recycling_recipe().
    if mods["quality"] and settings.startup["eb-make-traditional"].value then
        recycling.generate_recycling_recipe(data.raw["recipe"][eb_recipe.name],
            function()
                return true
            end
        )
    end
end
