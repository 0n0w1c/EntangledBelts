for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    if recipes["entangled-belt"] and technologies["logistics"] then
        recipes["entangled-belt"].enabled = technologies["logistics"].researched
    end

    if recipes["fast-entangled-belt"] and technologies["logistics-2"] then
        recipes["fast-entangled-belt"].enabled = technologies["logistics-2"].researched
    end

    if recipes["express-entangled-belt"] and technologies["logistics-3"] then
        recipes["express-entangled-belt"].enabled = technologies["logistics-3"].researched
    end

    if recipes["turbo-entangled-belt"] and technologies["turbo-transport-belt"] then
        recipes["turbo-entangled-belt"].enabled = technologies["turbo-transport-belt"].researched
    end

    if recipes["wood-entangled-belt"] and technologies["wood-logisitcs"] then
        recipes["wood-entangled-belt"].enabled = technologies["wood-logistics"].researched
    end
end
