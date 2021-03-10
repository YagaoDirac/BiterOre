--This Component scatters resource of entities in a surface near to its actor's position. All the resources in entity style can be handle by this. Such as Ores, crude oil sources, trees, rocks, or other entities.
--Prototypes needed: a list which doesn't help generally.

--------------  INCLUDE  ----------------
--require("bitter_ore_zone")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
bitore_source_content_crude_oil = {}
function bitore_source_content_crude_oil:tick(delta_time)
	--self.amount_to_gen = self.amount_to_gen + self.amount_per_minute*delta_time/60
	
	if self.data_count < self.max_count 
	then
		local random_offset = {math.random(60)-30,math.random(60)-30}
		local self_pos = self.parent:get_position()
		local position = self.parent:get_surface().find_non_colliding_position_in_box(self.name, {self_pos-{20,20}+random_offset,self_pos+{20,20}+random_offset}, 1, true)
		if position
		then
			local result = self.parent:get_surface().create_entity{name = self.name, position = position, amount= 300000*(0.1+math.random()*0.3)}	
			--This is very wired. If amount == 300000, it displays 100% in game.
			if result
			then 
				self.data_count = self.data_count+1
				self.data[self.data_count] = result
			end
		
		end
	end
	
	if self.data
	then
		local i = 1
		while i<=self.data_count
		do
			local v= self.data[i]
			if v.valid
			then
				local v_position = {v.position.x,v.position.y}
				setmetatable(v_position,mt.vector_2d)
				if (v_position-self.parent:get_position()):length_sqr()>self.distance_to_remove_generated_sqrsqrsqr
				then 
					v.destroy()
					self.data[i] = self.data[self.data_count]
					self.data[self.data_count] = nil
					self.data_count = self.data_count-1
				else
					i = i + 1
				end
			else
				self.data[i] = self.data[self.data_count]
				self.data[self.data_count] = nil
				self.data_count = self.data_count-1
			end
		end
	end
end


--function bitore_source_content_crude_oil:set_parent(object)
--	self.parent = object
--end

-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.bitore_source_content_crude_oil = new.bitore_source_content_crude_oil or {}
new.bitore_source_content_crude_oil[1] = function(data_table)--parent, name, count, distance_to_remove_generated
	local self = {}
	self.parent = data_table.parent
	self.name = data_table.name or "crude-oil"
	self.max_count = data_table.count or 3

	self.data = {}
	self.data_count = 0
	data_table.distance_to_remove_generated = math.max(data_table.distance_to_remove_generated, 5)
	self.distance_to_remove_generated_sqrsqrsqr = data_table.distance_to_remove_generated * data_table.distance_to_remove_generated

	setmetatable(self, mt.bitore_source_content_crude_oil)
	return self
end
function bitore_source_content_crude_oil:destroy()
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
mt.bitore_source_content_crude_oil = {}
mt.bitore_source_content_crude_oil.__newindex = function()end
mt.bitore_source_content_crude_oil.__index = bitore_source_content_crude_oil

	--["crude-oil"]

--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}
--static.bitore_source_content = {}
--
--

