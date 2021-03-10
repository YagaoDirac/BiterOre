--一个笔记。这个东西有2个管理方式，1是用某个find函数，找一个层里面是否有用户。2是去用户列表里面找。
--还有一个笔记。可能需要根据一个物体的坐标来做索引，不然可能很难很快速的查询到对应物体。换句话说，那个data字段可能要改。


--Prototypes needed: a list which doesn't help generally.

--------------  INCLUDE  ----------------
--require("dft.SOME_FILE_HERE")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
per_surface_tick_container = {}
function per_surface_tick_container:tick()
	local result
	for k,v in pairs(self.data)
	do 
		result = v:tick()
		if result and result.destroy then self:remove(v) end
	end
	--debug
	--log(serpent.block(self.data))
	
	if game.tick%self.enabled_update_period == self.random_delay
	then self:update_enabled()
	end
end

function per_surface_tick_container:add(item)
	self.count = self.count +1
	self.data[self.count] = item
	rawset(item, "self_index",self.count)
end
function per_surface_tick_container:remove(item)

	--log(serpent.block(self.data))

	local index = item.self_index
	item:destroy()
	self.data[self.count].self_index = index
	self.data[index] = self.data[self.count]
	self.data[self.count] = nil
	self.count = self.count -1
end
function per_surface_tick_container:set_enabled(the_boolean)
	for k,v in pairs(self.data)
	do v.enabled = the_boolean
	end
end
function per_surface_tick_container:update_enabled()
	local the_boolean = false
	local result = self.surface.find_entities({{-5555, -5555}, {5555, 5555}})
	--self.surface.find_entities_filtered{type = "character", force = "player", area = {{-5555, -5555}, {5555, 5555}}, limit = 1}
	--if #result>0 then 打开，不然就关闭
	--可能还可以用count_eneities_filtered


	for k,v in pairs(result)
	do
		if v.force and v.force.name == "player"
		then 
			the_boolean = true
			break
		end
	end

	game.print(the_boolean)

	self:set_enabled(the_boolean)
end


-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.per_surface_tick_container = new.per_surface_tick_container or {}
new.per_surface_tick_container[1] = function(data_table)
	local result = {}
	result.data = {}
	result.count = 0
	result.surface = data_table.surface
	
	result.enabled_update_period= 1200
	result.random_delay = math.floor(math.random(50))

	setmetatable(result, mt.per_surface_tick_container)
	return result
end
function per_surface_tick_container.destroy()
	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.per_surface_tick_container = {}
mt.per_surface_tick_container.__newindex = function()end
mt.per_surface_tick_container.__index = per_surface_tick_container

--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}
--static.tick_object_container = new.tick_object_container[1]()
