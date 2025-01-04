data.raw["item"]["underground-belt"].subgroup = "belt-underground"
data.raw["item"]["fast-underground-belt"].subgroup = "belt-underground"
data.raw["item"]["express-underground-belt"].subgroup = "belt-underground"

if mods["space-age"] then
    data.raw["item"]["turbo-underground-belt"].subgroup = "belt-underground"
    data.raw["recipe"]["turbo-entangled-belt"].surface_conditions = nil
end
