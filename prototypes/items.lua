local items = data.raw["item"]
local original_items = {}

for _, item in pairs(items) do
    table.insert(original_items, item)
end

for _, item in pairs(original_items) do
    if data.raw["underground-belt"][item.name] then
        item.subgroup = "belt-underground"

        local eb_item = table.deepcopy(item)
        if eb_item then
            eb_item.name = "eb-" .. item.name
            if item.place_result then
                eb_item.place_result = "eb-" .. item.place_result
            end
            eb_item.order = item.order .. "z"
            eb_item.localised_name = {
                "",
                "[virtual-signal=entangled-belts] ",
                item.localised_name or { "entity-name." .. item.name }
            }

            eb_item.icon = nil

            local icon_array = { icon = item.icon }
            if item.icon_size then
                icon_array.icon_size = item.icon_size
            end

            eb_item.icons =
            {
                icon_array,
                { icon = "__EntangledBelts__/graphics/icons/white-shuffle.png", icon_size = 32, scale = 0.5, shift = { -7, -9 } }
            }

            data.extend({ eb_item })
        end
    end
end
