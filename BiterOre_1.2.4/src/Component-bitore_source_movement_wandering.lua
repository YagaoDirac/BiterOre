--2个时间是测试版本。  28行和 60
--Prototypes needed: a list which doesn't help generally.

--------------  INCLUDE  ----------------
--require("bitter_ore_zone")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
bitore_source_movement_wandering = {}
function bitore_source_movement_wandering:tick(delta_time)
	local moving_distance = delta_time*self.speed /60
	local self_to_way_point = self.way_point[self.heading] - self.position
	local self_to_way_point_length = self_to_way_point:length()
	if self_to_way_point_length < moving_distance*4 
	then 
		local old_index = self.heading
		local new_index = math.random(#self.way_point-1)
		if new_index >= old_index 
		then self.heading = new_index+1
		else self.heading = new_index
		end
	end
	
	local direction = self_to_way_point/(self_to_way_point_length)
	local offset = direction * moving_distance 
		+new.vector_2d[1](math.random()*moving_distance-moving_distance*0.5,
								math.random()*moving_distance-moving_distance*0.5)*9
	self.position = self.position + offset
	


	if __DEBUG_names
	then
		for k,v in ipairs(self.way_point)
		do 
			rendering.draw_text{text="way point", surface=self.surface, target=v, color=self.parent.DEBUG_color, scale=1.5, time_to_live=delta_time+1, players=__DEBUG_names,scale_with_zoom=true}
		end
		if __DEBUG_fast
		then 
			rendering.draw_circle{color=self.parent.DEBUG_color, radius=self.max_way_point_distance, width=1, filled=false, target=self.original_position, surface=self.surface, time_to_live=delta_time+1, players=__DEBUG_names, draw_on_ground=true} 
		end
	end

end
--function bitore_source_movement_wandering:set_parent(object)
--	self.parent = object
--end

-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.bitore_source_movement_wandering = new.bitore_source_movement_wandering or {}
new.bitore_source_movement_wandering[1] = function(data_table)--parent, surface, do_spawn_zone_protection, spawn_zone_protection_distance, position, max_way_point_distance


	local self = {}
	self.parent = data_table.parent
	self.surface = data_table.surface
	self.position = data_table.position
	self.max_way_point_distance = data_table.max_way_point_distance
		--vector_2d, distance, [max_loop_count, multiplier]
	
	if do_spawn_zone_protection
	then
		self.position = static.spawn_zone_protection.move_away(self.position, data_table.spawn_zone_protection_distance+data_table.max_way_point_distance)
	end
	
	if __DEBUG_fast
	then
		self.original_position = self.position
	end

	setmetatable(self.position, mt.vector_2d)

	self.way_point = new.array_simple[1]()
	if __DEBUG_fast then self.speed = 4 else self.speed = 0.1 end
	if __DEBUG_fast 
	then
		for i = 1, 6 
		do 
			local angle = i*(3.14159265354/3)
			local new_way_point = self.position+new.vector_2d[1](math.cos(angle), math.sin(angle))*self.max_way_point_distance
			self.way_point:add(new_way_point)
		end
	else
		for i = 1, 10
		do 
			local angle = math.random()*31.4
			local new_way_point = self.position+new.vector_2d[1](math.cos(angle), math.sin(angle))*self.max_way_point_distance*math.random()
			self.way_point:add( new_way_point)
		end
	end

	self.heading = 1

	setmetatable(self, mt.bitore_source_movement_wandering)
	return self
end
function bitore_source_movement_wandering:destroy()

	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.bitore_source_movement_wandering = {}
mt.bitore_source_movement_wandering.__newindex = function()end
mt.bitore_source_movement_wandering.__index = bitore_source_movement_wandering


--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}
--static.bitore_source_content = {}
--
--static.bitore_source_movement[1] = new.bitore_source_movement[1]{surface = game.surfaces[1]}



