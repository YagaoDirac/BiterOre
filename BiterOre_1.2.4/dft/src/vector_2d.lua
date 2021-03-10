--Prototypes needed: NONE

--------------  INCLUDE  ----------------
--NONE

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
local vector_2d = {}


function vector_2d:length()
	return math.sqrt(self[1]*self[1]+self[2]*self[2])
end
function vector_2d:length_sqr()
	return self[1]*self[1]+self[2]*self[2]
end
function vector_2d:normalize()
	self = self / self:length()
end
	
function vector_2d:print()
--Do not use this print function in data.lua stage.
	game.print(serpent.block(self))
end
function vector_2d:log()
	log(serpent.block(self))
end
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.vector_2d = new.vector_2d or {}
new.vector_2d[1] = function(x,y)
	x = x or 0
	y = y or 0
	local result = {x,y}
	setmetatable(result, mt.vector_2d)
	return result
end
--function vector_2d:destroy()
--	self = nil
--end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.vector_2d = {}
mt.vector_2d.__newindex = function()end
mt.vector_2d.__index = vector_2d
mt.vector_2d.__add = function(lhs, rhs)
	return new.vector_2d[1](lhs[1]+rhs[1], lhs[2]+rhs[2])
end
mt.vector_2d.__sub = function(lhs, rhs)
--log(serpent.block(rhs))
	return new.vector_2d[1](lhs[1]-rhs[1], lhs[2]-rhs[2])
end
mt.vector_2d.__mul = function(lhs, rhs)
	return new.vector_2d[1](lhs[1]*rhs, lhs[2]*rhs)
end
mt.vector_2d.__div = function(lhs, rhs)
	return new.vector_2d[1](lhs[1]/rhs, lhs[2]/rhs)
end
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
static = static or {}
static.rand_vec2d = function(x,y)
	x = x or 1
	y = y or 1
	return new.vector_2d(math.random()*x, math.random()*y)
end