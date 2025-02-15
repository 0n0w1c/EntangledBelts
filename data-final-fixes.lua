require("prototypes.entities")
require("prototypes.items")
require("prototypes.recipes")
require("prototypes.technology")

if settings.startup["eb-no-red-inserter-challenge"] then
    local challenge_accepted = settings.startup["eb-no-red-inserter-challenge"].value

    if challenge_accepted then
        data.raw["inserter"]["long-handed-inserter"].hidden = challenge_accepted
        data.raw["inserter"]["long-handed-inserter"].next_upgrade = nil
        data.raw["item"]["long-handed-inserter"].hidden = challenge_accepted
        data.raw["recipe"]["long-handed-inserter"].hidden = challenge_accepted
    end
end
