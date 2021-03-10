--Prototypes needed: NONE

--------------  INCLUDE  ----------------
--NONE

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
local array_simple = {}


function array_simple:add(element)
	self.length = self.length +1
	rawset(self, self.length, element)
end
function array_simple:pop(pos)
	if not(pos>0) then return nil end
	local result = self[pos]
	self[pos] = self[self.length]
	rawset(self, self.length, nil)
	self.length = self.length -1
end
function array_simple:get_rand()
	return self[math.random(self.length)]
end

function array_simple:print()
--Do not use this print function in data.lua stage.
	game.print(serpent.block(self))
end
function array_simple:log()
	log(serpent.block(self))
end
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.array_simple = new.array_simple or {}
new.array_simple[1] = function()
	local self = {}
	self.length = 0
	setmetatable(self, mt.array_simple)
	return self
end
--function array_simple:destroy()
--	self = nil
--end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.array_simple = {}
mt.array_simple.__newindex = function()end
mt.array_simple.__index = array_simple
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}
