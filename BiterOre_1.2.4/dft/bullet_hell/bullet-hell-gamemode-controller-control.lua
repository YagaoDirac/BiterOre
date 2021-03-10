--bullet-hell-gamemode-controller-control 这个只是控制器
--Prototypes needed: sprite, projectile without image

--------------  INCLUDE  ----------------
--require("bullet_simple_test-control")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
bullet_hell_gamemode_controller = {}
function bullet_hell_gamemode_controller:tick()
	--log(serpent.block(self))
	rendering.draw_sprite{sprite=self.sprite, target = self.pos, surface = self.surface, orientation = 0, time_to_live = 2}
	
	--also, parameter tint and render_layer help a lot.
end

function bullet_hell_gamemode_controller:tick_since_created()
	return game.tick-self.create_tick
end

-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.bullet_hell_gamemode_controller = new.bullet_hell_gamemode_controller or {}
new.bullet_hell_gamemode_controller[1] = function(data_table)--player_index
	local result = {}
	result.player_index = data_table.player_index
	result.surface = "debug"
	result.pos = {0,0}
	setmetatable(result.pos, mt.vector_2d)
	result.sprite = "character-sprite-reimu"
	--result.ori = {0,0}
	--result.create_tick = game.tick
	--result.tick_object_container = data_table.tick_object_container or static.tick_object_container
	--result.tick_object_container:add(result)--dft infrastruction

	setmetatable(result, mt.bullet_hell_gamemode_controller)
	return result
end
function bullet_hell_gamemode_controller:destroy()
	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.bullet_hell_gamemode_controller = {}
mt.bullet_hell_gamemode_controller.__newindex = function()end
mt.bullet_hell_gamemode_controller.__index = bullet_hell_gamemode_controller

--mt.bullet_hell_gamemode_controller.__add = function ()
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
--static.bullet_hell_gamemode_controller.FUNCTION_NAME_HERE = function()
--	...
--end
