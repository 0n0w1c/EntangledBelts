local original_items = {}

for _, item in pairs(data.raw["item"]) do
    if not item.hidden
        and item.place_result
        and data.raw["underground-belt"][item.place_result]
    then
        original_items[#original_items + 1] = item
    end
end

for _, item in pairs(original_items) do
    local eb_item = table.deepcopy(item)

    if not mods["boblogistics"] then
        if not settings.startup["eb-make-traditional"].value then
            item.subgroup = "belt-underground"
            eb_item.subgroup = "belt-underground"
        end
    end

    eb_item.name = "eb-" .. item.name
    eb_item.place_result = "eb-" .. item.place_result
    eb_item.order = (item.order or "") .. "z"
    eb_item.localised_name = {
        "",
        "[virtual-signal=entangled-belts]",
        { "entity-name." .. item.name }
    }

    eb_item.icon = nil

    local icons = {}

    if item.icons then
        for _, icon in ipairs(item.icons) do
            icons[#icons + 1] = table.deepcopy(icon)
        end
    elseif item.icon then
        icons[#icons + 1] = {
            icon = item.icon,
            icon_size = item.icon_size or 64,
            scale = item.icon_scale,
            shift = item.icon_shift,
            tint = item.icon_tint
        }
    end

    icons[#icons + 1] = {
        icon = "__EntangledBelts__/graphics/icons/white-shuffle.png",
        icon_size = 32,
        scale = 0.5,
        shift = { -8, -8 }
    }

    eb_item.icons = icons

    data:extend({ eb_item })
end
