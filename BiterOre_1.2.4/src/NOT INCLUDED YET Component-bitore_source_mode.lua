--2个时间是测试版本。  28行和 60
--Prototypes needed: a list which doesn't help generally.

--------------  INCLUDE  ----------------
--require("bitter_ore_zone")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
bitore_source_mode = {}

function bitore_source_mode:tick(delta_time)
	if game.tick> self.tick_to_change_mode then self:change_mode() end

	local the_mode = self.mode[self.mode_index]
	self.value = self.value*(1-the_mode.drag)+the_mode.value*the_mode.drag
end
function bitore_source_mode:change_mode()
	local old_index = self.mode_index
	local new_index = math.random(#self.mode-1)
	if new_index >= old_index 
	then self.mode_index = new_index+1
	else self.mode_index = new_index
	end

	local new_mode = self.mode[self.mode_index]
	local duration = new_mode.min_duration+math.random()*new_mode.max_duration-new_mode.min_duration
	self.tick_to_change_mode = game.tick + duration
end
--function bitore_source_mode:start(object)
--	self.duration = self.min_duration+math.random(self.max_duration - self.min_duration) 
--
--	self.is_on = true
--	self.start_tick = game.tick
--end
--function bitore_source_mode:stop(object)
--	self.is_on = false
--end
--function bitore_source_mode:tick_from_start(object)
--	if self.is_on 
--	then return game.tick= self.start_tick
--	else return false
--	end
--end
--function bitore_source_mode:timed_out(object)
--	return self:tick_from_start()>self.duration 
--end
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.bitore_source_mode = new.bitore_source_mode or {}
new.bitore_source_mode[1] = function(data_table)--init_value
	local self = {}
	self.name = "wandering"
	--self.min_duration = 6000
	--self.max_duration = 18000

	--self.is_on = false
	--self.start_tick = false
	--self.duration = false

	if __DEBUG 
	then self.tick_to_change_mode = game.tick
	else self.tick_to_change_mode = game.tick+1200
	end
	self.mode = {
	{value = 1, drag = 0.01, min_duration = 6000, max_duration = 18000},
	{value = 0.3, drag = 0.01, min_duration = 6000, max_duration = 18000},
	{value = 2, drag = 0.07, min_duration = 600, max_duration = 1200, entrance = true},
	}
	self:init_mode_start_end_point_table()

	self.mode_index = 1
	self.value = data_table.init_value or 0

	setmetatable(self, mt.bitore_source_mode)
	return self
end
function bitore_source_mode:init_mode_start_end_point_table()

	self.mode_start_point = {}
	self.mode_end_point = {}
	for i = 1,#self.mode 
	do 
		if self.mode[i].entrance 
		then 
			self.mode_start_point[i] = true 
			self.mode_end_point[i-1] = true 
		else 
			self.mode_start_point[i] = false 
			self.mode_end_point[i-1] = false 
		end
	end
	self.mode_end_point[0] = nil
	self.mode_end_point[#self.mode] = true
end

function bitore_source_mode:destroy()

	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.bitore_source_mode = {}
mt.bitore_source_mode.__newindex = function()end
mt.bitore_source_mode.__index = bitore_source_mode


--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}
--static.bitore_source_content = {}
--
--static.bitore_source_movement[1] = new.bitore_source_movement[1]{surface = game.surfaces[1]}



