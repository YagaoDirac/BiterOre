--Prototypes needed: a list which doesn't help generally.

--------------  INCLUDE  ----------------
require "Component-bitore_source_content_biter"
require "Component-bitore_source_content_crude_oil"
require "Component-bitore_source_content_ore"
require "Component-bitore_source_content_simple_entity"
require "Component-bitore_source_movement_wandering"

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
bitore_moving_source = {}
function bitore_moving_source:tick(delta_time)
	self.movement:tick(delta_time)
	if self.content_array
	then
		for k,v in pairs(self.content_array)
		do v:tick(delta_time)
		end
	end

	if __DEBUG_names
	then
		rendering.draw_text{text=self.what, surface=self:get_surface(), target=self.movement.position, color=self.DEBUG_color, scale=3, time_to_live=delta_time+1, players=__DEBUG_names,scale_with_zoom=true}
		for i = 1, #self.content_array 
		do
			rendering.draw_text{text=self.content_array[i].name, surface=self:get_surface(), target=self.movement.position + {0,i*1.5+4}, color=self.DEBUG_color, scale=1.5, time_to_live=delta_time+1, players=__DEBUG_names,scale_with_zoom=true}
		end
		rendering.draw_line{color=self.DEBUG_color, width=3, gap_length=2, dash_length=1, from=self.movement.position,  to=self.movement.way_point[self.movement.heading], surface=self:get_surface(), time_to_live=delta_time+1,  players=__DEBUG_names, draw_on_ground=true}
	end

end
--function bitore_moving_source:damage(event)
	--When any enemy is killed near this moving source, decreases the hp for this source.

--end
function bitore_moving_source:get_position()
	return self.movement.position
end
function bitore_moving_source:get_surface()
	return self.movement.surface
end
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.bitore_moving_source = new.bitore_moving_source or {}


--------------     Safe     ----------------
--------------     Safe     ----------------
--------------     Safe     ----------------
--------------     Safe     ----------------
--------------     Safe     ----------------
--------------     Safe     ----------------
--------------     Safe     ----------------
--------------     Safe     ----------------
--------------     Safe     ----------------
new.bitore_moving_source.safe = new.array_simple[1]()
new.bitore_moving_source.safe:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 50, 20, 1.5)

	local __self = {}

	__self.what = "safe" .. 1

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 0, 
		do_spawn_zone_protection = false,
		max_way_point_distance = 75}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 120, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 120, distance_to_scatter = 16}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 1, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.25, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.1, g = 0.7, b = 0.2, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source.safe:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 50, 20, 1.5)

	local __self = {}
	
	__self.what = "safe" .. 2

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 0, 
		do_spawn_zone_protection = false,
		max_way_point_distance = 75}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 120, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 180, distance_to_scatter = 16}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 1, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.4, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.1, g = 0.7, b = 0.2, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)
	
new.bitore_moving_source.safe:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 50, 20, 1.5)

	local __self = {}

	__self.what = "safe" .. 3

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 0, 
		do_spawn_zone_protection = false,
		max_way_point_distance = 75}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 60, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 20, distance_to_scatter = 30}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 150, distance_to_scatter = 16}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 1, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.2, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.1, g = 0.7, b = 0.2, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source[0] = new.bitore_moving_source.safe 

--------------     Easy     ----------------
--------------     Easy     ----------------
--------------     Easy     ----------------
--------------     Easy     ----------------
--------------     Easy     ----------------
--------------     Easy     ----------------
--------------     Easy     ----------------
--------------     Easy     ----------------
--------------     Easy     ----------------
new.bitore_moving_source.easy = new.array_simple[1]()

new.bitore_moving_source.easy:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 50, 20, 1.5)

	local __self = {}

	__self.what = "easy" .. 1

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 100, 
		do_spawn_zone_protection = false,
		max_way_point_distance = 90}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 9, amount_per_minute = 1, distance_to_attack = 20}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 300, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 80, distance_to_scatter = 30}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 30, distance_to_scatter = 50}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 50, distance_to_scatter = 16}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.3, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.06, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.5, g = 0.6, b = 0.2, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source.easy:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 50, 20, 1.5)

	local __self = {}
	
	__self.what = "easy" .. 2

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 100, 
		do_spawn_zone_protection = false,
		max_way_point_distance = 125}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 5, amount_per_minute = 1, distance_to_attack = 25}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 100, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 30, distance_to_scatter = 50}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 175, distance_to_scatter = 16}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.8, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.2, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.5, g = 0.6, b = 0.2, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source.easy:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 50, 20, 1.5)

	local __self = {}
	
	__self.what = "easy" .. 3

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 100, 
		do_spawn_zone_protection = false,
		max_way_point_distance = 100}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 3, amount_per_minute = 60, distance_to_attack = 25}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 120, distance_to_scatter = 30}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 30, distance_to_scatter = 50}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 120, distance_to_scatter = 16}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.4, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.5, g = 0.6, b = 0.2, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source.easy:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 50, 20, 1.5)

	local __self = {}
	
	__self.what = "easy" .. 4

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 100, 
		do_spawn_zone_protection = false,
		max_way_point_distance = 50}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 2, amount_per_minute = 0.5, distance_to_attack = 20}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 50, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 50, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 20, distance_to_scatter = 50}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 120, distance_to_scatter = 16}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.08, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.06, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.5, g = 0.6, b = 0.2, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source.easy:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 50, 20, 1.5)

	local __self = {}
	
	__self.what = "easy" .. 5

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 100, 
		do_spawn_zone_protection = false,
		max_way_point_distance = 90}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 15, amount_per_minute = 1.5, distance_to_attack = 20}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 6, amount_per_minute = 1, distance_to_attack = 20}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 350, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 150, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 100, distance_to_scatter = 50}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 120, distance_to_scatter = 16}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.5, g = 0.6, b = 0.2, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source[1] = new.bitore_moving_source.easy 

--------------    Normal    ----------------
--------------    Normal    ----------------
--------------    Normal    ----------------
--------------    Normal    ----------------
--------------    Normal    ----------------
--------------    Normal    ----------------
--------------    Normal    ----------------
--------------    Normal    ----------------
--------------    Normal    ----------------
new.bitore_moving_source.normal = new.array_simple[1]()
new.bitore_moving_source.normal:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 200, 20, 1.5)

	local __self = {}

	__self.what = "normal" .. 1

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 0, 
		do_spawn_zone_protection = true,
		max_way_point_distance = 150}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 30, amount_per_minute = 3, distance_to_attack = 60}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 4, amount_per_minute = 1, distance_to_attack = 45}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 12, amount_per_minute = 3, distance_to_attack = 60}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 350, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 150, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 100, distance_to_scatter = 50}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 120, distance_to_scatter = 16}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 1, distance_to_remove_generated = 50}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.3, g = 0.7, b = 0.02, a = 0.65} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source.normal:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 200, 20, 1.5)

	local __self = {}

	__self.what = "normal" .. 2

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 0, 
		do_spawn_zone_protection = true,
		max_way_point_distance = 150}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 65, amount_per_minute = 8, distance_to_attack = 80}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 12, amount_per_minute = 2.5, distance_to_attack = 70}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 35, amount_per_minute = 4, distance_to_attack = 60}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 1350, distance_to_scatter = 50}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 650, distance_to_scatter = 70}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 150, distance_to_scatter = 50}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 500, distance_to_scatter = 35}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 3, distance_to_remove_generated = 100}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.3, g = 0.7, b = 0.02, a = 0.65} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source.normal:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 200, 20, 1.5)

	local __self = {}

	__self.what = "normal" .. 3

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 0, 
		do_spawn_zone_protection = false,
		max_way_point_distance = 75}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 25, amount_per_minute = 8, distance_to_attack = 40}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 9, amount_per_minute = 2.5, distance_to_attack = 40}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 15, amount_per_minute = 6, distance_to_attack = 45}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-spitter", max_count = 3, amount_per_minute = 1, distance_to_attack = 30}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 500, distance_to_scatter = 50}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 350, distance_to_scatter = 30}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 150, distance_to_scatter = 50}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 400, distance_to_scatter = 50}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 3, distance_to_remove_generated = 100}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.3, g = 0.7, b = 0.02, a = 0.65} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source.normal:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 200, 20, 1.5)

	local __self = {}

	__self.what = "normal" .. 4

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 0, 
		do_spawn_zone_protection = true,
		max_way_point_distance = 125}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 125, amount_per_minute = 3, distance_to_attack = 120}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 50, amount_per_minute = 0.8, distance_to_attack = 75}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 75, amount_per_minute = 1.5, distance_to_attack = 100}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-spitter", max_count = 35, amount_per_minute = 0.3, distance_to_attack = 50}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 850, distance_to_scatter = 80}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 650, distance_to_scatter = 70}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 150, distance_to_scatter = 60}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 400, distance_to_scatter = 60}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 1, distance_to_remove_generated = 100}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.3, g = 0.7, b = 0.02, a = 0.65} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source[2] = new.bitore_moving_source.normal 

--------------     Hard     ----------------
--------------     Hard     ----------------
--------------     Hard     ----------------
--------------     Hard     ----------------
--------------     Hard     ----------------
--------------     Hard     ----------------
--------------     Hard     ----------------
--------------     Hard     ----------------
--------------     Hard     ----------------
new.bitore_moving_source.hard = new.array_simple[1]()
new.bitore_moving_source.hard:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 300, 20, 1.5)

	local __self = {}

	__self.what = "hard" .. 1

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 50, 
		do_spawn_zone_protection = true,
		max_way_point_distance = 200}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 100, amount_per_minute = 10, distance_to_attack = 100}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 35, amount_per_minute = 5, distance_to_attack = 90}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-biter", max_count = 8, amount_per_minute = 1, distance_to_attack = 90}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 60, amount_per_minute = 5, distance_to_attack = 90}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-spitter", max_count = 25, amount_per_minute = 3, distance_to_attack = 80}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-spitter", max_count = 12, amount_per_minute = 1, distance_to_attack = 65}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 1750, distance_to_scatter = 60}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 1500, distance_to_scatter = 70}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 400, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 750, distance_to_scatter = 70}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 3, distance_to_remove_generated = 75}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.6, g = 0.7, b = 0.02, a = 0.65} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source.hard:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 300, 20, 1.5)

	local __self = {}

	__self.what = "hard" .. 2

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 50, 
		do_spawn_zone_protection = true, 
		max_way_point_distance = 200}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 250, amount_per_minute = 30, distance_to_attack = 125}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 125, amount_per_minute = 20, distance_to_attack = 120}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-biter", max_count = 30, amount_per_minute = 6, distance_to_attack = 115}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 170, amount_per_minute = 20, distance_to_attack = 135}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-spitter", max_count = 100, amount_per_minute = 8, distance_to_attack = 120}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-spitter", max_count = 15, amount_per_minute = 2, distance_to_attack = 90}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 3750, distance_to_scatter = 90}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 3500, distance_to_scatter = 100}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 400, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 1500, distance_to_scatter = 100}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 7, distance_to_remove_generated = 125}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.6, g = 0.7, b = 0.02, a = 0.65} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)
new.bitore_moving_source.hard:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 300, 20, 1.5)

	local __self = {}

	__self.what = "hard" .. 3

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 50, 
		do_spawn_zone_protection = true,
		max_way_point_distance = 125}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 60, amount_per_minute = 20, distance_to_attack = 60}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 60, amount_per_minute = 10, distance_to_attack = 60}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-biter", max_count = 15, amount_per_minute = 2, distance_to_attack = 60}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 40, amount_per_minute = 15, distance_to_attack = 60}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-spitter", max_count = 35, amount_per_minute = 8, distance_to_attack = 60}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-spitter", max_count = 12, amount_per_minute = 2, distance_to_attack = 60}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 1750, distance_to_scatter = 40}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 1000, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 400, distance_to_scatter = 30}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 750, distance_to_scatter = 70}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 1, distance_to_remove_generated = 75}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.6, g = 0.7, b = 0.02, a = 0.65} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)
new.bitore_moving_source.hard:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 300, 20, 1.5)

	local __self = {}

	__self.what = "hard" .. 4

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 50, 
		do_spawn_zone_protection = true,
		max_way_point_distance = 100}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 50, amount_per_minute = 3, distance_to_attack = 60}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 25, amount_per_minute = 1, distance_to_attack = 50}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-biter", max_count = 6, amount_per_minute = 0.6, distance_to_attack = 40}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 100, amount_per_minute = 12, distance_to_attack = 70}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-spitter", max_count = 75, amount_per_minute = 8, distance_to_attack = 60}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-spitter", max_count = 45, amount_per_minute = 7.5, distance_to_attack = 50}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 750, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 2500, distance_to_scatter = 100}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 400, distance_to_scatter = 30}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 750, distance_to_scatter = 70}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 3, distance_to_remove_generated = 75}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 0.6, g = 0.7, b = 0.02, a = 0.65} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source[3] = new.bitore_moving_source.hard 


--------------     Crazy     ----------------
--------------     Crazy     ----------------
--------------     Crazy     ----------------
--------------     Crazy     ----------------
--------------     Crazy     ----------------
--------------     Crazy     ----------------
--------------     Crazy     ----------------
--------------     Crazy     ----------------
--------------     Crazy     ----------------
new.bitore_moving_source.crazy = new.array_simple[1]()
new.bitore_moving_source.crazy:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 300, 20, 1.5)

	local __self = {}

	__self.what = "crazy" .. 1

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 200, 
		do_spawn_zone_protection = true,
		max_way_point_distance = 300}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 500, amount_per_minute = 50, distance_to_attack = 150}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 350, amount_per_minute = 45, distance_to_attack = 150}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-biter", max_count = 120, amount_per_minute = 12, distance_to_attack = 135}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-biter", max_count = 40, amount_per_minute = 4, distance_to_attack = 135}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 200, amount_per_minute = 25, distance_to_attack = 150}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-spitter", max_count = 120, amount_per_minute = 12, distance_to_attack = 140}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-spitter", max_count = 60, amount_per_minute = 6, distance_to_attack = 130}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-spitter", max_count = 20, amount_per_minute = 2, distance_to_attack = 120}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 5000, distance_to_scatter = 120}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 7500, distance_to_scatter = 120}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 1200, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 3500, distance_to_scatter = 70}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "uranium-ore", amount_per_minute = 300, distance_to_scatter = 20}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 3, distance_to_remove_generated = 125}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 1, g = 0.5, b = 0.02, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source.crazy:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 300, 20, 1.5)

	local __self = {}

	__self.what = "crazy" .. 2
	
	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 200, 
		do_spawn_zone_protection = true, 
		max_way_point_distance = 300}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 500, amount_per_minute = 75, distance_to_attack = 175}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 500, amount_per_minute = 65, distance_to_attack = 175}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-biter", max_count = 300, amount_per_minute = 25, distance_to_attack = 155}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-biter", max_count = 120, amount_per_minute = 15, distance_to_attack = 145}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 400, amount_per_minute = 75, distance_to_attack = 175}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-spitter", max_count = 300, amount_per_minute = 50, distance_to_attack = 170}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-spitter", max_count = 200, amount_per_minute = 30, distance_to_attack = 160}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-spitter", max_count = 150, amount_per_minute = 25, distance_to_attack = 150}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 9000, distance_to_scatter = 170}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 12500, distance_to_scatter = 150}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 1200, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 2500, distance_to_scatter = 200}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "uranium-ore", amount_per_minute = 1200, distance_to_scatter = 20}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 3, distance_to_remove_generated = 125}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 1, g = 0.5, b = 0.02, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)
new.bitore_moving_source.crazy:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 300, 20, 1.5)

	local __self = {}

	__self.what = "crazy" .. 3
	
	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 200, 
		do_spawn_zone_protection = true,
		max_way_point_distance = 300}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 250, amount_per_minute = 20, distance_to_attack = 100}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 250, amount_per_minute = 25, distance_to_attack = 100}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-biter", max_count = 170, amount_per_minute = 18, distance_to_attack = 90}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-biter", max_count = 80, amount_per_minute = 8, distance_to_attack = 80}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 120, amount_per_minute = 16, distance_to_attack = 150}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-spitter", max_count = 100, amount_per_minute = 12, distance_to_attack = 140}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-spitter", max_count = 60, amount_per_minute = 6, distance_to_attack = 130}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-spitter", max_count = 20, amount_per_minute = 1.5, distance_to_attack = 120}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 2000, distance_to_scatter = 140}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 3500, distance_to_scatter = 150}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 1200, distance_to_scatter = 30}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 500, distance_to_scatter = 100}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "uranium-ore", amount_per_minute = 300, distance_to_scatter = 20}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 1, distance_to_remove_generated = 75}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 1, g = 0.5, b = 0.02, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)
new.bitore_moving_source.crazy:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 300, 20, 1.5)

	local __self = {}

	__self.what = "crazy" .. 4
	
	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 200, 
		do_spawn_zone_protection = true,
		max_way_point_distance = 300}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 100, amount_per_minute = 30, distance_to_attack = 100}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 70, amount_per_minute = 20, distance_to_attack = 100}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-biter", max_count = 40, amount_per_minute = 20, distance_to_attack = 80}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-biter", max_count = 20, amount_per_minute = 12, distance_to_attack = 60}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 70, amount_per_minute = 25, distance_to_attack = 100}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-spitter", max_count = 50, amount_per_minute = 25, distance_to_attack = 100}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-spitter", max_count = 35, amount_per_minute = 15, distance_to_attack = 75}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-spitter", max_count = 20, amount_per_minute = 8, distance_to_attack = 55}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 2000, distance_to_scatter = 150}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 3500, distance_to_scatter = 160}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 1200, distance_to_scatter = 225}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 1500, distance_to_scatter = 200}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "uranium-ore", amount_per_minute = 150, distance_to_scatter = 20}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 3, distance_to_remove_generated = 125}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 1, g = 0.5, b = 0.02, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source[4] = new.bitore_moving_source.crazy 











--------------  Impossible   ----------------
--------------  Impossible   ----------------
--------------  Impossible   ----------------
--------------  Impossible   ----------------
--------------  Impossible   ----------------
--------------  Impossible   ----------------
--------------  Impossible   ----------------
--------------  Impossible   ----------------
--------------  Impossible   ----------------
new.bitore_moving_source.impossible = new.array_simple[1]()
new.bitore_moving_source.impossible:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 300, 20, 1.5)

	local __self = {}

	__self.what = "impossible" .. 1

	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 200, 
		do_spawn_zone_protection = true,
		max_way_point_distance = 400}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 500, amount_per_minute = 50, distance_to_attack = 150}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 350, amount_per_minute = 75, distance_to_attack = 250}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-biter", max_count = 240, amount_per_minute = 55, distance_to_attack = 250}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-biter", max_count = 180, amount_per_minute = 40, distance_to_attack = 225}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 200, amount_per_minute = 25, distance_to_attack = 150}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-spitter", max_count = 180, amount_per_minute = 30, distance_to_attack = 225}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-spitter", max_count = 150, amount_per_minute = 30, distance_to_attack = 210}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-spitter", max_count = 90, amount_per_minute = 25, distance_to_attack = 190}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 50000, distance_to_scatter = 280}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 75000, distance_to_scatter = 300}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 10000, distance_to_scatter = 150}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 30000, distance_to_scatter = 250}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "uranium-ore", amount_per_minute = 8000, distance_to_scatter = 150}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 12, distance_to_remove_generated = 200}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 1, g = 0.5, b = 0.02, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source.impossible:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 300, 20, 1.5)

	local __self = {}

	__self.what = "impossible" .. 2
	
	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 200, 
		do_spawn_zone_protection = true,
		max_way_point_distance = 400}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 500, amount_per_minute = 50, distance_to_attack = 150}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 350, amount_per_minute = 75, distance_to_attack = 250}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-biter", max_count = 350, amount_per_minute = 100, distance_to_attack = 300}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-biter", max_count = 250, amount_per_minute = 60, distance_to_attack = 275}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 200, amount_per_minute = 25, distance_to_attack = 150}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-spitter", max_count = 180, amount_per_minute = 30, distance_to_attack = 225}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-spitter", max_count = 250, amount_per_minute = 60, distance_to_attack = 275}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-spitter", max_count = 160, amount_per_minute = 45, distance_to_attack = 245}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 30000, distance_to_scatter = 280}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 55000, distance_to_scatter = 300}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 8000, distance_to_scatter = 150}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 20000, distance_to_scatter = 250}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "uranium-ore", amount_per_minute = 8000, distance_to_scatter = 150}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 3, distance_to_remove_generated = 300}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 1, g = 0.5, b = 0.02, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)
new.bitore_moving_source.impossible:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 300, 20, 1.5)

	local __self = {}

	__self.what = "impossible" .. 3
	
	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 200, 
		do_spawn_zone_protection = true,
		max_way_point_distance = 300}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 500, amount_per_minute = 50, distance_to_attack = 150}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 350, amount_per_minute = 75, distance_to_attack = 250}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-biter", max_count = 240, amount_per_minute = 15, distance_to_attack = 250}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-biter", max_count = 150, amount_per_minute = 8, distance_to_attack = 225}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 200, amount_per_minute = 25, distance_to_attack = 150}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-spitter", max_count = 180, amount_per_minute = 30, distance_to_attack = 225}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-spitter", max_count = 150, amount_per_minute = 8, distance_to_attack = 210}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-spitter", max_count = 150, amount_per_minute = 5, distance_to_attack = 190}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 12000, distance_to_scatter = 280}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 22500, distance_to_scatter = 300}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 3000, distance_to_scatter = 150}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 1000, distance_to_scatter = 250}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "uranium-ore", amount_per_minute = 800, distance_to_scatter = 150}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 2, distance_to_remove_generated = 200}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 1, g = 0.5, b = 0.02, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)
new.bitore_moving_source.impossible:add(function(data_table)--surface, position vector_2d
	--vector_2d, distance, max_loop_count, multiplier
	data_table.position = static.spawn_zone_protection.move_away(data_table.position, 300, 20, 1.5)

	local __self = {}

	__self.what = "impossible" .. 4
	
	--__self.surface = data_table.surface
	--__self.position = data_table.position
	--setmetatable(__self.position, mt.vector_2d)

	--__self.mode_array = to do 

	__self.movement = data_table.movement 
	or new.bitore_source_movement_wandering[1]{parent = "temporarily invalid", surface = data_table.surface,
		position = data_table.position, 
		spawn_zone_protection_distance = 200, 
		do_spawn_zone_protection = true,
		max_way_point_distance = 300}
	--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	rawset(__self.movement, "parent", __self)

	
	__self.content_array = {}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-biter", max_count = 500, amount_per_minute = 50, distance_to_attack = 150}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-biter", max_count = 350, amount_per_minute = 75, distance_to_attack = 250}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-biter", max_count = 75, amount_per_minute = 25, distance_to_attack = 200}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-biter", max_count = 35, amount_per_minute = 12, distance_to_attack = 185}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "small-spitter", max_count = 200, amount_per_minute = 25, distance_to_attack = 150}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "medium-spitter", max_count = 180, amount_per_minute = 30, distance_to_attack = 225}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "big-spitter", max_count = 150, amount_per_minute = 30, distance_to_attack = 210}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_biter[1]{name = "behemoth-spitter", max_count = 75, amount_per_minute = 25, distance_to_attack = 185}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "iron-ore", amount_per_minute = 5000, distance_to_scatter = 280}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "copper-ore", amount_per_minute = 7500, distance_to_scatter = 300}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "stone", amount_per_minute = 1000, distance_to_scatter = 150}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "coal", amount_per_minute = 3000, distance_to_scatter = 250}
	__self.content_array[#__self.content_array + 1] = new.bitore_source_content_ore[1]{name = "uranium-ore", amount_per_minute = 300, distance_to_scatter = 150}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "tree-01", amount_per_minute = 0.15, distance_to_remove_generated = nil, distance_to_scatter = 20, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_simple_entity[1]{name = "rock-big", amount_per_minute = 0.02, distance_to_remove_generated = nil, distance_to_scatter = 8, centralize = 2.5}
	--__self.content_array[#__self.content_array + 1] = new.bitore_source_content_crude_oil[1]{count = 12, distance_to_remove_generated = 200}
	
	for k,v in pairs(__self.content_array)
	do
		rawset(v, "parent", __self)
	end
	
	if __DEBUG_names then __self.DEBUG_color = {r = 1, g = 0.5, b = 0.02, a = 0.7} end

	setmetatable(__self, mt.bitore_moving_source)
	return __self
end)

new.bitore_moving_source[5] = new.bitore_moving_source.impossible 













function bitore_moving_source:destroy()
	for k,v in pairs(self.content_array) do v:destroy() end
	self.movement:destroy()
	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.bitore_moving_source = {}
mt.bitore_moving_source.__newindex = function()end
mt.bitore_moving_source.__index = bitore_moving_source

--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}
--static.bitore_moving_source.FUNCTION_NAME_HERE = function()
--	...
--end