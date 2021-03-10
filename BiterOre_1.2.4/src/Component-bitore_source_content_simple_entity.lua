--This Component scatters resource of entities in a surface near to its actor's position. All the resources in entity style can be handle by this. Such as Ores, crude oil sources, trees, rocks, or other entities.
--Prototypes needed: a list which doesn't help generally.

--------------  INCLUDE  ----------------
--require("bitter_ore_zone")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
bitore_source_content_simple_entity = {}
function bitore_source_content_simple_entity:tick(delta_time)
	self.amount_to_gen = self.amount_to_gen + self.amount_per_minute*(delta_time/3600)

	local times_to_gen = math.max(0,math.random()*self.amount_to_gen/3)
	for i = 1, times_to_gen
	do
		-- distance_to_scatter, centralize
		local centralize_for_this_time = math.pow(math.random(), self.centralize)
		local random_offset = {
			math.random()*self.distance_to_scatter * centralize_for_this_time, 
			math.random()*self.distance_to_scatter * centralize_for_this_time}


		local self_pos = self.parent:get_position()
		local position = self.parent:get_surface().find_non_colliding_position_in_box(self.name, {self_pos-{2,2}+random_offset,self_pos+{2,2}+random_offset}, 1)
		if position
		then
			local result = self.parent:get_surface().create_entity{name = self.name, position = position}	
			if result
			then
				if self.entityList then self.entityList:add(result) end
				self.amount_to_gen = self.amount_to_gen - 1
			end
		else 
			break
		end
	end


	if self.entityList
	then
		local i = 1
		while i<=self.entityList_count
		do
			local v= self.entityList[i]
			if (v.position-self.parent.get_position()):length_sqr()>self.distance_to_remove_generated_sqr
			then 
				v.destroy()
				self.entityList:pop(i)
			else
				i = i + 1
			end
		end
	end
end


--function bitore_source_content_simple_entity:set_parent(object)
--	self.parent = object
--end

-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.bitore_source_content_simple_entity = new.bitore_source_content_simple_entity or {}
new.bitore_source_content_simple_entity[1] = function(data_table)--parent, name, amount_per_minute, distance_to_remove_generated, distance_to_scatter, centralize
	local self = {}
	self.parent = data_table.parent
	self.name = data_table.name
	self.amount_per_minute = data_table.amount_per_minute
	self.distance_to_scatter = data_table.distance_to_scatter or 10
	self.centralize = data_table.centralize or 1

	if type(data_table.distance_to_remove_generated) == number and data_table.distance_to_remove_generated>0
	then 
		self.entityList = new.array_simple[1]()
		self.distance_to_remove_generated_sqr = data_table.distance_to_remove_generated * data_table.distance_to_remove_generated
	end

	self.amount_to_gen = 0




	setmetatable(self, mt.bitore_source_content_simple_entity)
	return self
end
function bitore_source_content_simple_entity:destroy()

	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.bitore_source_content_simple_entity = {}
mt.bitore_source_content_simple_entity.__newindex = function()end
mt.bitore_source_content_simple_entity.__index = bitore_source_content_simple_entity

	--["biter-spawner"] 
	--["spitter-spawner"] 
	--["small-worm-turret"] 
	--["medium-worm-turret"] 
	--["big-worm-turret"] 
	--["behemoth-worm-turret"] 
	--
	--["small-biter"] 
	--["medium-biter"] 
	--["big-biter"] 
	--["behemoth-biter"] 
	--
	--["small-spitter"] 
	--["medium-spitter"] 
	--["big-spitter"] 
	--["behemoth-spitter"]
	--
	--["coal"] 
	--["stone"] 
	--["iron-ore"] 
	--["copper-ore"] 
	--["uranium-ore"]
	--
	--["crude-oil"]

	--others: water[UNDONE], tree, rocks.


--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}
--static.bitore_source_content = {}
--
--

