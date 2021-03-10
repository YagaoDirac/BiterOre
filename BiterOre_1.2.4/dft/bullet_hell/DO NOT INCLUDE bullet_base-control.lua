--Prototypes needed: sprite, projectile without image

--------------  INCLUDE  ----------------
--require("../src/vector_2d-control")

--------------    NEW    ----------------
--------------    NEW    ----------------
--------------    NEW    ----------------
new = new or {}
new.bullet_simple_test = new.bullet_simple_test or {}

new.bullet_simple_test[1] = function(surface, name, start_pos, orientation, lifespan, force)
	local result = {}
	result.surface = surface
	result.sprite = "bullet-sprite-" .. name
	result.projectile = "bullet-projectile-" .. name
	result.pos = start_pos
	result.ori = orientation 
	lifespan = lifespan or 120 -- 2 sec as default
	result.lifespan = game.tick + lifespan
	result.force = force

	setmetatable(result, mt.bullet_simple_test)
	return result
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.bullet_simple_test = mt.bullet_simple_test or {}

mt.bullet_simple_test = {}
mt.bullet_simple_test.__newindex = function()
end
mt.bullet_simple_test.__index = function()
end

mt.bullet_simple_test.tick = function ( )
	if game.tick >= lifespan then self = nil end
	self.pos = self.pos +{0.004,0.004}
	self.ori = 45

	rendering.draw_sprite{surface = self.surface, name = self.sprite, target = self.pos, orientation = ori, time_to_live = 1}
	--also, parameter tint and render_layer help a lot.
	self.surface.create_eneity{surface = self.surface, name = self.projectile, position = self.pos,target = self.pos    ,speed =10000,max_range =10000, force = "enemy"}
	 
end


--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}
--static.bullet_simple_test.FUNCTION_NAME_HERE = function()
--	...
--end