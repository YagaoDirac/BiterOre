--------------  INCLUDE  ----------------
require("dft.SOME_FILE_HERE")

--------------    NEW    ----------------
--------------    NEW    ----------------
--------------    NEW    ----------------
new = new or {}
new.CLASS_NAME_HERE = new.CLASS_NAME_HERE or {}

new.CLASS_NAME_HERE[1] = function()
-- ...
	local result = {}
	setmetatable(result, mt.CLASS_NAME_HERE)
	return result
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.CLASS_NAME_HERE = mt.CLASS_NAME_HERE or {}

mt.CLASS_NAME_HERE = {}
mt.CLASS_NAME_HERE.__newindex = function()
end
mt.CLASS_NAME_HERE.__index = function()
end

--mt.__add = function(lhs, rhs)
--	return new.vector_2d(lhs[1]+rhs[1], lhs[2]+rhs[2])
--end
--mt.__sub = function(lhs, rhs)
--	return new.vector_2d(lhs[1]-rhs[1], lhs[2]-rhs[2])
--end
--mt.__mul = function(lhs, rhs)
--	return new.vector_2d(lhs[1]*rhs, lhs[2]*rhs)
--end
--mt.__div = function(lhs, rhs)
--	return new.vector_2d(lhs[1]/rhs, lhs[2]/rhs)
--end
--mt.length= function(self)
--	return math.sqrt(self[1]*self[1]+self[2]*self[2])
--end
--mt.length_sqr= function(self)
--	return self[1]*self[1]+self[2]*self[2]
--end
--mt.normalize= function(self)
--	self = self / self:length()
--end
	
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
static = static or {}
--static.CLASS_NAME_HERE.FUNCTION_NAME_HERE = function()
--	...
--end