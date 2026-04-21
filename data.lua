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
            icon = "__EntangledBelts__/graphics/icons/dark-shuffle.png",
            icon_size = 32,
            scale = 0.5
        }
    },
    hidden = true
}

local white_shuffle_sprite =
{
    type = "sprite",
    name = "eb-white-shuffle",
    filename = "__EntangledBelts__/graphics/icons/white-shuffle.png",
    height = 32,
    width = 32
}

data.extend({ belt_group, virtual_signal, white_shuffle_sprite })
