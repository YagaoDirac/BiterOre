--Notice that, according to the special require of create_entity function for the type of assembling-machine, the recipe field has to be assigned. But if you don't assign that, the game might take it as a nil. It works anyway, but remember this detail when you read the docs in LuaSurface.html, notice the so-called extra parameters, that's it.

--With these code, it's easy to make assembling machine with fixed recipe, without adding extra prototypes.
--[[

local am = main_surface.create_entity{name = "simple-assembling-machine", position = {30,0}, recipe = "iron-gear-wheel", force = "neutral"}
am.minable = false  --Actually this is not needed since the prototype has no minable field.
am.destructible = false  --Then the max HP is meaningless.
am.recipe_locked = true  --Recipe could be lock both in prototype via data.lua or in runtime in control.lua.

]]



simple_am_no_energy_consumption =
{
    type = "assembling-machine",
    name = "simple-assembling-machine",
    energy_source = {
        emissions_per_minute = 0,--4
        type = "void",  ----------This makes the machine not to consume any energy. Generally, if this machine is created via code and no power system is suposed to work with it, this is what you want.
        usage_priority = "secondary-input"
    },
    energy_usage = "1kW",
    flags = {
        --"placeable-neutral",
        --"placeable-player",
        --"player-creation"
    },

    animation = {
        layers = {
            {
                filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
                frame_count = 32,
                height = 114,
                hr_version = {
                    filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1.png",
                    frame_count = 32,
                    height = 226,
                    line_length = 8,
                    priority = "high",
                    scale = 0.5,
                    shift = {
                        0,
                        0.0625
                    },
                    width = 214
                },
                line_length = 8,
                priority = "high",
                shift = {
                    0,
                    0.0625
                },
                width = 108
            },
            {
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
                frame_count = 1,
                height = 83,
                hr_version = {
                    draw_as_shadow = true,
                    filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1-shadow.png",
                    frame_count = 1,
                    height = 165,
                    line_length = 1,
                    priority = "high",
                    repeat_count = 32,
                    scale = 0.5,
                    shift = {
                        0.265625,
                        0.15625
                    },
                    width = 190
                },
                line_length = 1,
                priority = "high",
                repeat_count = 32,
                shift = {
                    0.265625,
                    0.171875
                },
                width = 95
            }
        }
    },
    collision_box = {
        {
            -1.2,
            -1.2
        },
        {
            1.2,
            1.2
        }
    },
    corpse = "assembling-machine-1-remnants",
    crafting_categories = {
        "crafting",
        "basic-crafting",
        "advanced-crafting"
    },
    crafting_speed = 1,
    damaged_trigger_effect = {
        damage_type_filters = "fire",
        entity_name = "spark-explosion",
        offset_deviation = {
            {
                -0.5,
                -0.5
            },
            {
                0.5,
                0.5
            }
        },
        offsets = {
            {
                0,
                1
            }
        },
        type = "create-entity"
    },

    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_mipmaps = 4,
    icon_size = 64,
    max_health = 300,

    selection_box = {
        {
            -1.5,
            -1.5
        },
        {
            1.5,
            1.5
        }
    },
}
data:extend({simple_am_no_energy_consumption})






