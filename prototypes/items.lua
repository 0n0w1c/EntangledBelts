local items = data.raw["item"]
local original_items = {}

for _, item in pairs(items) do
    table.insert(original_items, item)
end

for _, item in pairs(original_items) do
    if data.raw["underground-belt"][item.name] then
        if not mods["boblogistics"] then
            item.subgroup = "belt-underground"
        end

        local eb_item = table.deepcopy(item)
        if eb_item and not item.hidden then
            eb_item.name = "eb-" .. item.name
            if item.place_result then
                eb_item.place_result = "eb-" .. item.place_result
            end
            eb_item.order = item.order .. "z"
            eb_item.localised_name =
            {
                "",
                "[virtual-signal=entangled-belts]",
                item.localised_name or { "entity-name." .. item.name }
            }

            eb_item.icon = nil

            local icons = {}

            if item.icons then
                for _, icon in ipairs(item.icons) do
                    table.insert(icons, icon)
                end
            elseif item.icon then
                table.insert
                (
                    icons,
                    {
                        icon = item.icon,
                        icon_size = item.icon_size or 64,
                        scale = item.icon_scale,
                        shift = item.icon_shift,
                        tint = item.icon_tint
                    }
                )
            end

            table.insert
            (
                icons,
                {
                    icon = "__EntangledBelts__/graphics/icons/white-shuffle.png",
                    icon_size = 32,
                    scale = 0.5,
                    shift = { -8, -8 }
                }
            )

            eb_item.icons = icons

            data.extend({ eb_item })
        end
    end
end
