--This file is copied from Mod Singistics.


data:extend(
{
  {
    type = "map-gen-presets",
    name = "default",
    -- default changes nothing
    Singistics =
    {
      order = "a",
      basic_settings =
      {
	      peaceful_mode = true,
      },
    },
  }
})

for i, resource in pairs (data.raw.resource) do
  resource.autoplace = nil
  data.raw["autoplace-control"][resource.name] = nil 
end
   
for i, resource in pairs (data.raw.tree) do
  resource.autoplace = nil
end
  
data.raw["autoplace-control"]["trees"] = nil
  