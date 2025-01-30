table.insert(data.raw['technology']['logistics'].effects, { type = "unlock-recipe", recipe = "entangled-belt" })
table.insert(data.raw['technology']['logistics-2'].effects, { type = "unlock-recipe", recipe = "fast-entangled-belt" })
table.insert(data.raw['technology']['logistics-3'].effects, { type = "unlock-recipe", recipe = "express-entangled-belt" })

if mods["space-age"] then
    table.insert(data.raw['technology']['turbo-transport-belt'].effects,
        { type = "unlock-recipe", recipe = "turbo-entangled-belt" })
end

if mods["wood-logistics"] then
    table.insert(data.raw['technology']['wood-logistics'].effects,
        { type = "unlock-recipe", recipe = "wood-entangled-belt" })
end
