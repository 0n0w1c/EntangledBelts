data:extend
({
    {
        type = "bool-setting",
        name = "eb-make-traditional",
        setting_type = "startup",
        default_value = false,
        order = "a"
    },
    {
        type = "bool-setting",
        name = "eb-no-red-inserter-challenge",
        setting_type = "startup",
        default_value = false,
        order = "b"
    },
    {
        type = "int-setting",
        name = "eb-built-overlay-seconds",
        setting_type = "startup",
        default_value = 10,
        minimum_value = 0,
        maximum_value = 60,
        order = "c"
    },
    {
        type = "int-setting",
        name = "eb-selected-overlay-seconds",
        setting_type = "startup",
        default_value = 3,
        minimum_value = 0,
        maximum_value = 60,
        order = "d"
    }
})
