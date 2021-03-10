--to valid the prototype, try command in game. /c game.players[1].insert{name = "simple-item-1", count = 1000}

local simple_item =
{
    type = "item",
    name = "simple-item-1",

    icon = config.ROOT_PATH .. "dft/simple_prototypes/icons/circle.png",
    --icon = "__Dirac-prototype-lib__/green-circle.png",
    icon_size = 64,
    stack_size = 100,
}
data:extend({simple_item})
local simple_item =
{
    type = "item",
    name = "simple-item-2",

    icons = {
        {
            icon = config.ROOT_PATH .. "dft/simple_prototypes/icons/circle.png",
            icon_size = 64,
            tint = {r = 0.2,g= 0.8,b=0.2,a=1}
        },
        {
            icon = config.ROOT_PATH .. "dft/simple_prototypes/icons/A.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8,-8}
        },
    } ,
    icon_mipmaps = 4,
    icon_size = 64,
    stack_size = 100,
}
data:extend({simple_item})


simple_recipe =
{
    type = "recipe",
    name = "simple-recipe",
    enabled = true,
    energy_required = 1,
    ingredients = {{type = "item", name = "simple-item-1", amount = 9}},
    results  = {{type = "item", name = "simple-item-2", probability = 1, amount = 1}}
}
data:extend({simple_recipe})