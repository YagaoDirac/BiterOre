--bitore_source_movement_test
--Prototypes needed: a list which doesn't help generally.

--------------  INCLUDE  ----------------
--require("bitter_ore_zone")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
bitore_source_movement_test = {}
function bitore_source_movement_test:tick(delta_time)
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
								math.random()*moving_distance-moving_distance*0.5)*2.5
	self.position = self.position + offset
	


	if __DEBUG_names
	then
		for k,v in ipairs(self.way_point)
		do 
			rendering.draw_text{text="way point", surface=self.surface, target=v, color=self.parent.DEBUG_color, scale=1.5, time_to_live=delta_time+1, players=__DEBUG_names,scale_with_zoom=true}
		end
		local left_top = self.original_position+new.vector_2d[1](-self.max_way_point_distance, -self.max_way_point_distance)
		local right_bottom = self.original_position+new.vector_2d[1](self.max_way_point_distance, self.max_way_point_distance)
		rendering.draw_rectangle{color=self.parent.DEBUG_color, left_top=left_top, right_bottom=right_bottom, width=1, filled=false, target=self.original_position, surface=self.surface, time_to_live=delta_time+1, players=__DEBUG_names, draw_on_ground=true} 
	end

end
--function bitore_source_movement_test:set_parent(object)
--	self.parent = object
--end

-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.bitore_source_movement_test = new.bitore_source_movement_test or {}
new.bitore_source_movement_test[1] = function(data_table)--parent, surface, spawn_zone_protection_distance, position, max_way_point_distance
	local self = {}
	self.parent = data_table.parent
	self.surface = data_table.surface
	self.position = data_table.position
	setmetatable(self.position, mt.vector_2d)
	self.max_way_point_distance = data_table.max_way_point_distance
	self.original_position = data_table.position

	self.way_point = new.array_simple[1]()
	if __DEBUG_fast then self.speed = 4 else self.speed = 0.2 end
	self.way_point:add(self.position+new.vector_2d[1](data_table.max_way_point_distance,data_table.max_way_point_distance))
	self.way_point:add(self.position+new.vector_2d[1](data_table.max_way_point_distance,-data_table.max_way_point_distance))
	self.way_point:add(self.position+new.vector_2d[1](-data_table.max_way_point_distance,data_table.max_way_point_distance))
	self.way_point:add(self.position+new.vector_2d[1](-data_table.max_way_point_distance,-data_table.max_way_point_distance))

	self.heading = 1

	setmetatable(self, mt.bitore_source_movement_test)
	return self
end
function bitore_source_movement_test:destroy()

	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.bitore_source_movement_test = {}
mt.bitore_source_movement_test.__newindex = function()end
mt.bitore_source_movement_test.__index = bitore_source_movement_test


--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}
--static.bitore_source_content = {}
--
--static.bitore_source_movement[1] = new.bitore_source_movement[1]{surface = game.surfaces[1]}



