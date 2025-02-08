local underground_belts = data.raw["underground-belt"]
local original_belts = {}

for _, belt in pairs(underground_belts) do
    table.insert(original_belts, belt)
end

for _, underground_belt in pairs(original_belts) do
    local eb_entity = table.deepcopy(underground_belt)

    if eb_entity then
        eb_entity.name = "eb-" .. underground_belt.name
        eb_entity.localised_name = {
            "",
            "[virtual-signal=entangled-belts] ",
            underground_belt.localised_name or { "entity-name." .. underground_belt.name }
        }
        if underground_belt.next_upgrade then
            eb_entity.next_upgrade = "eb-" .. underground_belt.next_upgrade
        end
        eb_entity.minable.result = underground_belt.name

        data.extend({ eb_entity })
    end
end
