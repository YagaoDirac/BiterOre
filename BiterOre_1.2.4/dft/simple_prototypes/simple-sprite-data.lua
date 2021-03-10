--local simple_sprite =
--{
--   type = "achievement",
--   name = "simple-sprite",
--   
--   icon = "__Dirac-prototype-lib__/prototypes/simple_prototypes/icons/black-A.png",
--   icon_size = 64
--}
--data:extend({simple_sprite})
local simple_sprite =
{
   type = "sprite",
   name = "simple-sprite",
   
   --filename = "__Dirac-prototype-lib__/dft/simple_prototypes/icons/black-A.png",
   filename = config.ROOT_PATH .. "dft/simple_prototypes/icons/black-A.png",
   size = 64--But generally you would like width and height
}
data:extend({simple_sprite})
