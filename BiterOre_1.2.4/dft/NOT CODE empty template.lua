--Prototypes needed: a list which doesn't help generally.

--------------  INCLUDE  ----------------
require("dft.SOME_FILE_HERE")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
CLASS_NAME_HERE = {}
function CLASS_NAME_HERE:tick()
	
end

-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.CLASS_NAME_HERE = new.CLASS_NAME_HERE or {}
new.CLASS_NAME_HERE[1] = function()
	local result = {}
	
	CODE HERE

	setmetatable(result, mt.CLASS_NAME_HERE)
	return result
end
function CLASS_NAME_HERE:destroy()

	RELEASE RESOURCES HERE

	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.CLASS_NAME_HERE = {}
mt.CLASS_NAME_HERE.__newindex = function()end
mt.CLASS_NAME_HERE.__index = CLASS_NAME_HERE

--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}
--static.CLASS_NAME_HERE.FUNCTION_NAME_HERE = function()
--	...
--end