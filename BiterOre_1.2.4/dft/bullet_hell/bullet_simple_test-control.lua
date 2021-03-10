--Prototypes needed: sprite, projectile without image

--------------  INCLUDE  ----------------
--require("./src/vector_2d-control")



--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
bullet_simple_test = {}
function bullet_simple_test:tick()
	if game.tick >= self.last_tick then self:destroy() self = nil return{destroy = true} end

	--log(game.tick)
	--log(serpent.block(self))

	local angle = self.ori*3.1415926535*2
	self.pos = new.vector_2d[1](math.cos(angle),math.sin(angle))*0.1 + self.pos
	--self.ori = 45

	rendering.draw_sprite{surface = self.surface, sprite = self.sprite, target = self.pos, orientation = self.ori, time_to_live = 2, x_scale =0.25, y_scale = 0.25}
	--also, parameter tint and render_layer help a lot.
	self.surface.create_entity{surface = self.surface, name = self.projectile, position = self.pos,target = self.pos ,speed =10000,max_range =10000, force = "enemy"}
end

-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.bullet_simple_test = new.bullet_simple_test or {}

new.bullet_simple_test[1] = function(data_table)--surface, name, start_pos, orientation, lifespan, force, tick_container
	local result = {}
	--new.bullet_simple_test[1]{surface=self.surface, name="knife", start_pos = self.pos, orientation = 0, lifespan = self.lifespan, force = self.force}
	result.surface = data_table.surface
	result.sprite = "bullet-sprite-" .. data_table.name
	result.projectile = "bullet-projectile-" .. data_table.name
	result.pos = data_table.start_pos
	setmetatable(result.pos, mt.vector_2d)
	result.ori = data_table.orientation 
	lifespan = data_table.lifespan or 90 -- 1.5 sec as default
	result.last_tick = game.tick + lifespan
	result.force = data_table.force
	
	setmetatable(result, mt.bullet_simple_test)
	
	--log(serpent.block(data_table))
	--log(getmetatable(data_table.tick_object_container))

	--The container table is not stored in bullet class.
	local tick_container = data_table.tick_container or static.tick_object_container
	tick_container:add(result)--dft infrastruction
	return result
end
function bullet_simple_test:destroy()
	--for k,v in pairs(self)
	--do v = nil
	--end
	self = nil
end
--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.bullet_simple_test = {}
mt.bullet_simple_test.__newindex = function()end
mt.bullet_simple_test.__index = bullet_simple_test




--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}

