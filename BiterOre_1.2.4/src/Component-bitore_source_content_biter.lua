--[text update needed.]This Component scatters resource of entities in a surface near to its actor's position. All the resources in entity style can be handle by this. Such as Ores, crude oil sources, trees, rocks, or other entities.
--Prototypes needed: a list which doesn't help generally.

--------------  INCLUDE  ----------------
--require("bitter_ore_zone")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
bitore_source_content_biter = {}
function bitore_source_content_biter:tick(delta_time)
	self.amount_to_gen = self.amount_to_gen + self.amount_per_minute*(delta_time/3600)
	self.amount_to_gen = math.min(self.amount_to_gen, self.max_count*2)

	if self.data.length < self.max_count and self.amount_to_gen>1
	then
		local random_offset = {math.random(20)-10,math.random(20)-10}
		local self_pos = self.parent:get_position()
		local position = self.parent:get_surface().find_non_colliding_position_in_box(self.name, {self_pos-{20,20}+random_offset,self_pos+{20,20}+random_offset}, 1, false)
		if position 
		then 
			local result = self.parent:get_surface().create_entity{name = self.name, position = position}
			if result 
			then 
				self.data:add(result)
				self.amount_to_gen = self.amount_to_gen -1
			end
		end
	end
	

		--self.unit_group.set_command{type = defines.command.go_to_location, destination = self:get_position(), radius = self.unit_group_radius, distraction = defines.distraction.by_none}
		--self.unit_group.set_command{type = defines.command.attack_area, destination = self:get_position(), radius = self.unit_group_radius, distraction = defines.distraction.by_anything}
		--self.unit_group.set_command{type = defines.command.wander, destination = self:get_position(), radius = self.unit_group_radius, distraction = defines.distraction.by_anything}
		--self.unit_group.start_moving()
	

	--remove the dead units from group. Not tested yet.
	local i = 1
	while i<=self.data.length
	do
		local v = self.data[i]
		if v.valid
		then
			--Sets command for the creepers. Makes them move.
			local v_position = {v.position.x,v.position.y}
			setmetatable(v_position,mt.vector_2d)
			if (v_position-(self.parent:get_position())):length_sqr()>self.distance_to_attack_sqrsqrsqr
			then 
				v.set_command{type = defines.command.go_to_location, destination = self:get_position(), radius = self.unit_group_radius, distraction = defines.distraction.by_none}
			else
				v.set_command{type = defines.command.attack_area, destination = self:get_position(), radius = self.unit_group_radius, distraction = defines.distraction.by_none}
			end
			i = i + 1
		else
			self.data:pop(i)
		end
	end

end

function bitore_source_content_biter:get_position()
	return self.parent:get_position()
end


--function bitore_source_content_biter:set_parent(object)
--	self.parent = object
--end

-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.bitore_source_content_biter = new.bitore_source_content_biter or {}
new.bitore_source_content_biter[1] = function(data_table)--parent, name, max_count,amount_per_minute,  distance_to_attack
	local self = {}
	self.parent = data_table.parent
	self.name = data_table.name or "small-biter"
	self.max_count = data_table.max_count or 5

	self.amount_to_gen = 0
	self.amount_per_minute = data_table.amount_per_minute or self.max_count/120


	self.data = new.array_simple[1]()
	if data_table.distance_to_attack 
	then 
		self.distance_to_attack_sqrsqrsqr = data_table.distance_to_attack * data_table.distance_to_attack
		self.unit_group_radius = data_table.distance_to_attack
	else
		self.distance_to_attack_sqrsqrsqr = 10000
		self.unit_group_radius = 100
	end

	setmetatable(self, mt.bitore_source_content_biter)
	return self
end
function bitore_source_content_biter:destroy()
	if self.data
	then
		for k,v in pairs(self.data)
		do
			v.destroy()
			v = nil
		end
	end
	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.bitore_source_content_biter = {}
mt.bitore_source_content_biter.__newindex = function()end
mt.bitore_source_content_biter.__index = bitore_source_content_biter

	--["small-biter"] 
	--["medium-biter"] 
	--["big-biter"] 
	--["behemoth-biter"] 
	--
	--["small-spitter"] 
	--["medium-spitter"] 
	--["big-spitter"] 
	--["behemoth-spitter"]

--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}
--static.bitore_source_content = {}
--
--

