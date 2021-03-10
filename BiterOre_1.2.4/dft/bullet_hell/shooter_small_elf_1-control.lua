--Prototypes needed: sprite, projectile without image

--------------  INCLUDE  ----------------
require("bullet_simple_test-control")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
shooter_small_elf_1 = {}
function shooter_small_elf_1:tick()
	--log(serpent.block(self))
	rendering.draw_sprite{sprite=self.sprite, target = self.pos, surface = self.surface, orientation = 0, time_to_live = 2}
	
	--also, parameter tint and render_layer help a lot.
	
	if self:tick_since_created()%300 == 0 and self.enabled
	then 
		self:update_blackboard()
		if self.blackboard.shoot_at
		then self:shoot_1()
		end
	end
end

function shooter_small_elf_1:tick_since_created()
	return game.tick-self.create_tick
end
function shooter_small_elf_1:shoot_1()
	local offset = 0.009--math.random() * 0.013
	local angle_start = -2/14-offset
	local angle_end = 2/14+offset +1
	local angle_step_length = (angle_end-angle_start)/18

	local pos_diff = self.blackboard.shoot_at - self.pos
	--game.print(math.atan2(pos_diff[2],pos_diff[1]))
	--game.print(serpent.block(pos_diff))
	local angle_from_diff = ((math.atan2(pos_diff[2],pos_diff[1]))/2)/3.1415926535

	for i = 0,18 
	do
		local angle = angle_from_diff + angle_start+angle_step_length*i
		new.bullet_simple_test[1]{surface=self.surface, name="knife", start_pos = self.pos, orientation = angle, lifespan = self.lifespan, force = self.force, tick_container = self.tick_object_container}
	end

	log(serpent.block({surface=self.surface, name="knife", start_pos = self.pos, orientation = angle, lifespan = self.lifespan, force = self.force, tick_container = self.tick_object_container}))
end
function shooter_small_elf_1:update_blackboard()
	local result = self.surface.find_entities{self.pos-{10,10},self.pos+{10,10}}
	--self.surface.find_entities_filtered{type = "character", force = "player", area = {self.pos-{10,10},self.pos+{10,10}}, limit = 3}
	--后面的逻辑也要改一下。
	--可能还可以用find_nearest_enemy

	--local result = self.surface.find_units {area= {self.pos-{10,10},self.pos+{10,10}},force="player",condition="same"}
	self.blackboard.shoot_at = nil
	for k,v in pairs(result)
	do 
		if v.force.name == "player"
		then 
			self.blackboard.shoot_at = new.vector_2d[1](v.position.x,v.position.y)
			break
		end
	end
	--log(serpent.block(#result))
	--for k,v in pairs(result) do
	--log(k)
	--log(serpent.block(v))
	--log(serpent.block(v.name))
	--log(serpent.block(v.force.name))
	--end

	--if #result>0 
	--then 
	--	local index = math.random(#result)
	--	self.blackboard.shoot_at = result[index].position
	--else
	--	self.blackboard.shoot_at = nil
	--end

end
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.shooter_small_elf_1 = new.shooter_small_elf_1 or {}
new.shooter_small_elf_1[1] = function(data_table)--surface, pos
	local result = {}
	result.surface = data_table.surface
	result.pos = data_table.pos
	setmetatable(result.pos, mt.vector_2d)
	--result.bullet_sprite = "bullet-sprite-knife"
	--result.bullet_projectile = "bullet-projectile-knife"
	result.ori = data_table.pos or 0
	result.force = data_table.force or "enemy"
	result.create_tick = game.tick
	result.sprite = "shooter-sprite-small_elf"
	result.enabled = data_table.enabled or false
	result.blackboard = {}
	result.tick_object_container = data_table.tick_object_container or static.tick_object_container
	result.tick_object_container:add(result)--dft infrastruction

	setmetatable(result, mt.shooter_small_elf_1)
	return result
end
function shooter_small_elf_1:destroy()
	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.shooter_small_elf_1 = {}
mt.shooter_small_elf_1.__newindex = function()end
mt.shooter_small_elf_1.__index = shooter_small_elf_1

--mt.shooter_small_elf_1.__add = function ()
--	rendering.draw_sprite{surface = self.surface, name = self.sprite, target = self.pos, orientation = 0,time_to_live = 1}
--	--also, parameter tint and render_layer help a lot.
--	--self.surface.create_eneity{surface = self.surface, name = self.projectile, position = self.pos,target = self.pos    ,speed =10000,max_range =10000, force = "enemy"}
--	 
--
--	if game.tick%200 == 0 
--	then self.shoot_1()
--	end
--end





--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}
--static.shooter_small_elf_1.FUNCTION_NAME_HERE = function()
--	...
--end