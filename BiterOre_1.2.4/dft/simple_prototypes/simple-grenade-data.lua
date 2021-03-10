--When create this entity, remember to spicity the speed and max_range fields. surface.create_entity{name = "simple-grenade",position = pos,target = pos ,speed =10000,max_range =10000}

local simple_grenade =
{
    type = "projectile",
    name = "simple-grenade",
    acceleration = 0.005,
    action =
    {
        {
            type = "area",
            radius = 6.5,
            action_delivery =
            {
                type = "instant",
                target_effects =
                {
                    {
                        type = "damage",
                        damage =
                        {
                            type = "explosion",
                            amount = 35
                        }
                    }
                }
            }
        }
    }
}
data:extend({simple_grenade})