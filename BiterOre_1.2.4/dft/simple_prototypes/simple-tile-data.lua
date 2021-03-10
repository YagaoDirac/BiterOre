local simple_tile =
{
    type = "tile",
    name = "simple-tile",

    collision_mask = {
        "ground-tile"
    },
    layer = 70,
    map_color = {
        b = 1,
        g = 1,
        r = 1
    },
    pollution_absorption_per_second = 0,
    variants = {
        empty_transitions = true,
        main = {
            {
                count = 1,
                picture = "__base__/graphics/terrain/lab-tiles/lab-white.png",
                size = 1
            }
        }
    }
}
data:extend({simple_tile})
