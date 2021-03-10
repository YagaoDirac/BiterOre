--Prototypes needed: sprite, projectile without image

--------------  INCLUDE  ----------------
require("bullet_simple_test-control")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
shooter_simple_test = {}
function shooter_simple_test:tick()
	--log(serpent.block(self))
	rendering.draw_sprite{sprite=self.sprite, target = self.pos, surface = self.surface, orientation = 0, time_to_live = 2}
	
	--also, parameter tint and render_layer help a lot.

	if self:tick_since_created()%200 == 0 and self.enabled
	then 
		self:update_blackboard()
		self:shoot_1()
	end
end

function shooter_simple_test:tick_since_created()
	return game.tick-self.create_tick
end
function shooter_simple_test:shoot_1()
	new.bullet_simple_test[1]{surface=self.surface, name="knife", start_pos = self.pos, orientation = 1/8, lifespan = self.lifespan, force = self.force}
end
function shooter_simple_test:update_blackboard()
	local result = self.surface.find_units{area= {self.pos-{10,10},self.pos+{10,10}},force="player",condition="same"}
	if #result>0 
	then 
		local index = math.random(#result)
		blackboard.shoot_direction = result[index].position
	end
end
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.shooter_simple_test = new.shooter_simple_test or {}
new.shooter_simple_test[1] = function(data_table)--surface, pos
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

	setmetatable(result, mt.shooter_simple_test)
	local tick_container = data_table.tick_object_container or static.tick_object_container
	tick_container:add(result)--dft infrastruction
	return result
end
function shooter_simple_test:destroy()
	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.shooter_simple_test = {}
mt.shooter_simple_test.__newindex = function()end
mt.shooter_simple_test.__index = shooter_simple_test

--mt.shooter_simple_test.__add = function ()
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
--static.shooter_simple_test.FUNCTION_NAME_HERE = function()
--	...
--end