local belt_group =
{
    type = "item-subgroup",
    name = "belt-underground",
    group = "logistics",
    order = "b[belt]-b[belt-underground]"
}

local virtual_signal =
{
    type = "virtual-signal",
    name = "entangled-belts",
    icons =
    {
        {
            icon = "__EntangledBelts__/graphics/icons/small-shuffle.png",
            icon_size = 32,
            mipmap_count = 2,
            scale = 0.5
        }
    },
    hidden = true
}

data.extend({ belt_group, virtual_signal })
