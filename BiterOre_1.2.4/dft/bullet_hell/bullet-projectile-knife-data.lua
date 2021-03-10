--When create this entity, remember to spicity the speed and max_range fields. surface.create_entity{name = "simple-grenade",position = pos,target = pos ,speed =10000,max_range =10000}

local simple_projectile =
{
    type = "projectile",
    name = "bullet-projectile-knife",
    acceleration = 0.005,
    action =
    {
        {
            type = "area",
            radius = 0.25,
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
                            amount = 5
                        }
                    }
                }
            }
        }
    }
}
data:extend({simple_projectile})