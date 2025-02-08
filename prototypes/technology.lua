local technologies = data.raw["technology"]
local underground_belts = data.raw["underground-belt"]

for _, technology in pairs(technologies) do
    if technology.effects then
        local effects_copy = {}
        for _, effect in pairs(technology.effects) do
            table.insert(effects_copy, effect)
        end

        for _, effect in pairs(effects_copy) do
            if effect.type == "unlock-recipe" and underground_belts[effect.recipe] then
                table.insert(technology.effects, { type = "unlock-recipe", recipe = "eb-" .. effect.recipe })
            end
        end
    end
end
