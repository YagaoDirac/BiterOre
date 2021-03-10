--This Component scatters resource of entities in a surface near to its actor's position. All the resources in entity style can be handle by this. Such as Ores, crude oil sources, trees, rocks, or other entities.
--Prototypes needed: a list which doesn't help generally.

--------------  INCLUDE  ----------------
--require("bitter_ore_zone")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
bitore_source_content_ore = {}
function bitore_source_content_ore:tick(delta_time)



	self.amount_to_gen = self.amount_to_gen + self.amount_per_minute*(delta_time/3600)

	local times_to_gen = math.max(0,math.random(8))
	for i = 1, times_to_gen
	do
		local distance_x_2 = self.distance_to_scatter*2
		local random_offset = {math.random(distance_x_2)-self.distance_to_scatter,math.random(distance_x_2)-self.distance_to_scatter}
		setmetatable(random_offset, mt.vector_2d)
		local self_pos = self.parent:get_position()
		--local position = self.parent:get_surface().find_non_colliding_position_in_box(self.name, {self_pos-{2,2}+random_offset,self_pos+{2,2}+random_offset}, 1, true)-- This method is stable but very slow.
		local position = self_pos+random_offset
		position[1] = math.floor(position[1])
		position[2] = math.floor(position[2])
		--local a = self_pos-{position.x, position.y}
		local a = random_offset
		a = a:length_sqr()
		a = math.pow(a,-0.2)
		--a = 1/a
		--local a = 1/((self_pos-position):length_sqr())
		a = math.max(0, math.min(1, a))
		local amount_to_gen = self.amount_to_gen/(1+math.random()*5) * a


		local temp_fake_distance = math.max(math.abs(position[1]), math.abs(position[2]))
		local temp_fake_distance_minus_200_over_4 = (temp_fake_distance - 200)/4
		if amount_to_gen>temp_fake_distance_minus_200_over_4 and amount_to_gen>15
		then
			local temp_tile = self.parent:get_surface().get_tile(position[1],position[2])
			if temp_tile and temp_tile.valid
			then
				local tile_name = temp_tile.name			
				if tile_name ~= "water" and
					tile_name ~= "deepwater" and
					tile_name ~= "water-green" and
					tile_name ~= "deepwater-green" and
					tile_name ~= "water-shallow" and
					tile_name ~= "water-mud" 
				then
					local result = self.parent:get_surface().create_entity{name = self.name, position = position, amount = amount_to_gen}	
					if result
					then

	--game.print(serpent.block({name = self.name, position = position, amount = amount_to_gen}))
						


						--if self.data then table.insert(self.data, result) end
						self.amount_to_gen = self.amount_to_gen - result.amount
					end
				end
			end
		end
		
	end
	
end


--function bitore_source_content_ore:set_parent(object)
--	self.parent = object
--end

-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.bitore_source_content_ore = new.bitore_source_content_ore or {}
new.bitore_source_content_ore[1] = function(data_table)--parent, name, amount_per_minute, distance_to_scatter
	local self = {}
	self.parent = data_table.parent
	self.name = data_table.name or "stone"
	self.amount_per_minute = data_table.amount_per_minute or 10

	if type(data_table.distance_to_scatter) == "number" and data_table.distance_to_scatter>2
	then self.distance_to_scatter = data_table.distance_to_scatter
	else self.distance_to_scatter = 10
	end

	self.amount_to_gen = 0

	setmetatable(self, mt.bitore_source_content_ore)
	return self
end
function bitore_source_content_ore:destroy()

	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.bitore_source_content_ore = {}
mt.bitore_source_content_ore.__newindex = function()end
mt.bitore_source_content_ore.__index = bitore_source_content_ore

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

