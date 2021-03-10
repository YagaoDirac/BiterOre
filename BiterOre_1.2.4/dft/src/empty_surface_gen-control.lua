dft = dft or {}
dft.gen_empty_surface = function(name, width, height)
    width = width or 1
    height = height or 1
    local mgs = {
        autoplace_controls = {
            coal = {
                frequency = 1,
                richness = 1,
                size = 0
            },
            ["copper-ore"] = {
                frequency = 1,
                richness = 1,
                size = 0
            },
            ["crude-oil"] = {
                frequency = 1,
                richness = 1,
                size = 0
            },
            ["enemy-base"] = {
                frequency = 1,
                richness = 1,
                size = 0
            },
            ["iron-ore"] = {
                frequency = 1,
                richness = 1,
                size = 0
            },
            stone = {
                frequency = 1,
                richness = 1,
                size = 0
            },
            trees = {
                frequency = 1,
                richness = 1,
                size = 0
            },
            ["uranium-ore"] = {
                frequency = 1,
                richness = 1,
                size = 0
            }
        },
        autoplace_settings = {},
        cliff_settings = {
            cliff_elevation_0 = 10,
            cliff_elevation_interval = 40,
            name = "cliff",
            richness = 0
        },
        peaceful_mode = false,
        property_expression_names = {},
        seed = 4083961782,
        starting_area = 1,
        starting_points = {
            {
                x = 0,
                y = 0
            }
        },
        terrain_segmentation = 1,
        water = 0,

        height = height,
        width = width
    }
    return game.create_surface(name, mgs)
end

--call this in script.on_event(defines.events.on_chunk_generated, function(event)    dft.clear_surface_after_gen_empty(surface)   end)
dft.clear_surface_after_gen_empty = function (surface)
    surface.set_tiles({{name  = "out-of-map",position={0,0}}})--have to wait for the chunk generated to happen.
end