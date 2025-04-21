require("prototypes.entities")
require("prototypes.items")
require("prototypes.recipes")
require("prototypes.technology")

local setting = settings.startup["eb-no-red-inserter-challenge"]
local challenge_accepted = setting and setting.value

setting = settings.startup["bobmods-logistics-inserteroverhaul"]
local inserter_overhaul = setting and setting.value

if challenge_accepted and not inserter_overhaul then
    if data.raw["inserter"]["long-handed-inserter"] then
        data.raw["inserter"]["long-handed-inserter"].hidden = true
        data.raw["inserter"]["long-handed-inserter"].next_upgrade = nil
    end

    if data.raw["item"]["long-handed-inserter"] then
        data.raw["item"]["long-handed-inserter"].hidden = true
    end

    if data.raw["recipe"]["long-handed-inserter"] then
        data.raw["recipe"]["long-handed-inserter"].hidden = true
    end

    if mods["bobinserters"] or mods["boblogistics"] then
        if data.raw["technology"]["bob-long-inserters-1"] then
            data.raw["technology"]["bob-long-inserters-1"] = nil
        end

        if data.raw["technology"]["bob-long-inserters-2"] then
            data.raw["technology"]["bob-long-inserters-2"] = nil
        end
    end
end
