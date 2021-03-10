--Prototypes needed: a list which doesn't help generally.

--------------  INCLUDE  ----------------
--require("dft.SOME_FILE_HERE")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
tick_object_container = {}
function tick_object_container:tick()
	local result
	for k,v in pairs(self.data)
	do 
		result = v:tick()
		if result and result.destroy then self:remove(v) end
	end

	--debug
	--log(serpent.block(self.data))
end

function tick_object_container:add(item)
	self.count = self.count +1
	self.data[self.count] = item
	rawset(item, "self_index",self.count)
end
function tick_object_container:remove(item)

	--log(serpent.block(self.data))

	local index = item.self_index
	item:destroy()
	self.data[self.count].self_index = index
	self.data[index] = self.data[self.count]
	self.data[self.count] = nil
	self.count = self.count -1
end
function tick_object_container:set_enabled(the_boolean)
	for k,v in pairs(self.data)
	do v.enabled = the_boolean
	end
end

-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.tick_object_container = new.tick_object_container or {}
new.tick_object_container[1] = function()
	local result = {}
	result.data = {}
	result.count = 0

	setmetatable(result, mt.tick_object_container)
	return result
end
function tick_object_container.destroy()
	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.tick_object_container = {}
mt.tick_object_container.__newindex = function()end
mt.tick_object_container.__index = tick_object_container

--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
static = static or {}
static.tick_object_container = new.tick_object_container[1]()
