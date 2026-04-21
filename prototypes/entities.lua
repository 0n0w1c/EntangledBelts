local function item_to_return(underground_belt)
    if settings.startup["eb-make-traditional"].value then
        return "eb-" .. underground_belt.name
    else
        return underground_belt.name
    end
end

local original_belts = {}

for _, underground_belt in pairs(data.raw["underground-belt"]) do
    if underground_belt.minable and not underground_belt.hidden then
        original_belts[#original_belts + 1] = underground_belt
    end
end

for _, underground_belt in pairs(original_belts) do
    local eb_entity = table.deepcopy(underground_belt)

    eb_entity.name = "eb-" .. underground_belt.name
    eb_entity.localised_name = {
        "",
        "[virtual-signal=entangled-belts]",
        { "entity-name." .. underground_belt.name }
    }

    if underground_belt.next_upgrade then
        eb_entity.next_upgrade = "eb-" .. underground_belt.next_upgrade
    end

    eb_entity.minable.result = item_to_return(underground_belt)
    eb_entity.minable.count = 1
    eb_entity.minable.results = nil

    data:extend({ eb_entity })
end
