--------------  INCLUDE  ----------------
require("vector_2d")

--------------    NEW    ----------------
--------------    NEW    ----------------
--------------    NEW    ----------------
new = new or {}
new.chunk_manager = new.chunk_manager or {}

local function chunk_manager_ctor()
	local result = {}
	result.data = {}
	result.count = 0
	setmetatable(result, mt.chunk_manager)
	return result
end

new.chunk_manager[1] = chunk_manager_ctor


--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.chunk_manager = mt.chunk_manager or {}

mt.chunk_manager = {}
mt.chunk_manager.__newindex = function()
end
mt.chunk_manager.__index = function()
end


function mt.chunk_manager:is_empty()
	return count==0
end

function mt.chunk_manager:add_chunk (x,y)
	if not self.data.x
	then 
		self.data.x {count = 0}
	end
	self.data.x.y = self.data.x.y or {}

	self.count = self.count +1
	self.data.x.count = self.data.x.count +1
end

function mt.chunk_manager:get_chunk (x,y)
	if not self.data.x then return nil end
	return self.data.x.y
end

function mt.chunk_manager:get_random_position (x,y)
	if self.is_empty() then return {0,0} end
	local rand_index = math.random(1,count)
	local sum = 0
	local x =0
	local y =0
	for x, v in pairs(self.data)
	do
		if sum + v.count > rand_index 
		then 
			local left_times =  sum + v.count - rand_index 
			for y, v2 in pairs(v)
			do left_times = left_times-1
				if left_times == 0 
				then break 
				end
			end
		end
	end

	return static.rand_vec2d(32,32) + new.vector_2d[1](x*32,y*32)
end



--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------


