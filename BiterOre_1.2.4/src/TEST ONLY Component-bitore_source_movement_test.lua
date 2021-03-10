--2个时间是测试版本。  28行和 60
--Prototypes needed: a list which doesn't help generally.

--------------  INCLUDE  ----------------
--require("bitter_ore_zone")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
bitore_source_movement_test = {}
function bitore_source_movement_test:tick(delta_time)
	if game.tick % 600 <300
	then
		self.position = self.position + {0.3*delta_time,0}
	else
		self.position = self.position - {0.3*delta_time,0}
	end

	
end
--function bitore_source_movement_test:set_parent(object)
--	self.parent = object
--end



-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.bitore_source_movement_test = new.bitore_source_movement_test or {}
new.bitore_source_movement_test[1] = function(data_table)--parent, position
	local self = {}
	self.parent = data_table.parent
	self.position = data_table.position
	setmetatable(self.position, mt.vector_2d)


	setmetatable(self, mt.bitore_source_movement_test)
	return self
end
function bitore_source_movement_test:destroy()

	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.bitore_source_movement_test = {}
mt.bitore_source_movement_test.__newindex = function()end
mt.bitore_source_movement_test.__index = bitore_source_movement_test


--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}
--static.bitore_source_content = {}
--
--static.bitore_source_movement[1] = new.bitore_source_movement[1]{surface = game.surfaces[1]}



