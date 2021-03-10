--现在的 to_gen 字段的用法要改。改成需要生成各种虫子多少个。
--Prototypes needed: a list which doesn't help generally.

--------------  INCLUDE  ----------------
require("Actor-bitore_moving_source")

--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
--------------MEMBER FUNCTION----------------
bitore_tick_container = {}
function bitore_tick_container:tick()
	if game.tick>=self.next_tick
	then 
		self.next_tick = self.next_tick + self.tick_interval

		for k,v in ipairs(self.childNodes)
		do 
			v:tick(self.tick_interval)
			--local result = v:tick(self.tick_interval)
			--if result.destroy 
			--then
			--	v:destroy()
			--	v = nil
			--	table.remove(self.childNodes, k)
			--end
		end


		--The early game accelerator.
		if game.tick/60/60/60>24 
		then self.earlygame_sources = nil --memory leaks. But, it's fine.
		end

		if self.earlygame_sources
		then
			for k,v in ipairs(self.earlygame_sources)
			do 
				v:tick(self.tick_interval)
			end
		end




	end
end

function bitore_tick_container:on_chunk_generated(event)
	self.chunk_count = self.chunk_count +1
	
	if __DEBUG_single_source
	then
		if self.chunk_count == 10 
		then 
			local position = new.vector_2d[1](20,20)
			local temp = new.bitore_moving_source[1][1]{surface = event.surface, position = position}
			self.childNodes:add(temp)
		end
	else
		if self.chunk_count>10 
		then 
			self.to_gen.total = self.to_gen.total + self.to_gen.per_chunk
			if self.to_gen.total >1
			then
				local chunk_mid_position = new.vector_2d[1](event.area.left_top.x + 16, event.area.left_top.y + 16)
				local distance = chunk_mid_position:length()
				local source_level = self:distance_to_source_level(distance)

				-- emmm , this map is not finished. So,
				if source_level > 5 then source_level = 5 end

				--log(source_level)



				local ctor_function = new.bitore_moving_source[source_level]:get_rand()
				local new_resource = ctor_function{surface = event.surface, position = chunk_mid_position}
				self.childNodes:add(new_resource)
				self.to_gen.total = self.to_gen.total -1
			end
		end
	end
end

function bitore_tick_container:distance_to_source_level(distance)
	-- for   0 ~ 100, lvl <-> safe <-> 0
	-- for 100 ~ 300, lvl <-> easy <-> 1
	-- for 300 ~ 500, lvl <-> normal <-> 2 
	-- for 500 ~ 1000, lvl <-> hard <-> 3
	-- for 1000 ~ 1500, lvl <-> crazy <-> 4
	-- for 1500 ~ 2000, lvl <-> impossible <-> 5
	-- for 2000 ~ 2400, lvl <-> positive water, which doesn't mess up the buildings.
	-- for 2400 ~ , lvl <-> active water, which turns everything into water tiles.
	

	if distance<50 then return 0 end

	local lvl_min = 0
	if distance<200 
	then 
		local p = static.dft_util.reverse_lerp(50,200,distance)
		if math.random()<p then return lvl_min + 1 else return lvl_min end
	end
	lvl_min = lvl_min + 1
	if distance<400 
	then 
		local p = static.dft_util.reverse_lerp(200,400,distance)
		if math.random()<p then return lvl_min + 1 else return lvl_min end
	end
	lvl_min = lvl_min + 1
	if distance<750 
	then 
		local p =  static.dft_util.reverse_lerp(400,750,distance)
		if math.random()<p then return lvl_min + 1 else return lvl_min end
	end
	lvl_min = lvl_min + 1
	if distance<1250 
	then  
		local p = static.dft_util.reverse_lerp(750,1250,distance)
		if math.random()<p then return lvl_min + 1 else return lvl_min end
	end
	lvl_min = lvl_min + 1
	if distance<1750 
	then   
		local p = static.dft_util.reverse_lerp(1250,1750,distance)
		if math.random()<p then return lvl_min + 1 else return lvl_min end
	end
	lvl_min = lvl_min + 1
	if distance<2200 
	then   
		local p = static.dft_util.reverse_lerp(1750,2200,distance)
		if math.random()<p then return lvl_min + 1 else return lvl_min end
	end
	lvl_min = lvl_min + 1
	if distance<2500 
	then   
		local p = static.dft_util.reverse_lerp(2200,2500,distance)
		if math.random()<p then return lvl_min + 1 else return lvl_min end
	end
	return 7
end

--Another set of value

--function bitore_tick_container:distance_to_source_level(distance)
--	-- for   0 ~ 100, lvl <-> safe <-> 0
--	-- for 100 ~ 200, lvl <-> easy <-> 1
--	-- for 200 ~ 300, lvl <-> normal <-> 2 
--	-- for 300 ~ 500, lvl <-> hard <-> 3
--	-- for 500 ~ 700, lvl <-> crazy <-> 4
--	-- for 700 ~ 1000, lvl <-> impossible <-> 5
--	-- for 1000 ~ 2400, lvl <-> positive water, which doesn't mess up the buildings.
--	-- for 2400 ~ , lvl <-> active water, which turns everything into water tiles.
--	
--
--	if distance<100 then return 0 end
--
--	local lvl_min = 0
--	if distance<150 
--	then 
--		local p = static.dft_util.reverse_lerp(100,150,distance)
--		if math.random()<p then return lvl_min + 1 else return lvl_min end
--	end
--	lvl_min = lvl_min + 1
--	if distance<250 
--	then 
--		local p = static.dft_util.reverse_lerp(150,250,distance)
--		if math.random()<p then return lvl_min + 1 else return lvl_min end
--	end
--	lvl_min = lvl_min + 1
--	if distance<400 
--	then 
--		local p =  static.dft_util.reverse_lerp(250,400,distance)
--		if math.random()<p then return lvl_min + 1 else return lvl_min end
--	end
--	lvl_min = lvl_min + 1
--	if distance<600 
--	then  
--		local p = static.dft_util.reverse_lerp(400,600,distance)
--		if math.random()<p then return lvl_min + 1 else return lvl_min end
--	end
--	lvl_min = lvl_min + 1
--	if distance<850
--	then   
--		local p = static.dft_util.reverse_lerp(600,850,distance)
--		if math.random()<p then return lvl_min + 1 else return lvl_min end
--	end
--	lvl_min = lvl_min + 1
--	if distance<1700 
--	then   
--		local p = static.dft_util.reverse_lerp(850,1700,distance)
--		if math.random()<p then return lvl_min + 1 else return lvl_min end
--	end
--	lvl_min = lvl_min + 1
--	if distance<2500 
--	then   
--		local p = static.dft_util.reverse_lerp(1700,2500,distance)
--		if math.random()<p then return lvl_min + 1 else return lvl_min end
--	end
--	return 7
--end












--function bitore_tick_container:source_level_to_name(level)
--	local result = false
--	if not result and level < 1
--	then 
--		if math.random()<level then result = "easy" else result = "safe" end
--	end
--	if not result then result = "easy"
--
--	
--	-- to do    if not result and level < 2
--	
--	--stage 2
--	if "safe" = result 
--	then
--		result = result .. random(3)
--		return result
--	end
--	if "easy" = result 
--	then
--		result = result .. random(5)
--		return result
--	end	
--
--
--end

-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
-------------- CTOR n DTOR ----------------
new = new or {}
new.bitore_tick_container = new.bitore_tick_container or {}
new.bitore_tick_container[1] = function(data_table)--surface
	local self = {}
	self.surface = data_table.surface
	
	if __DEBUG_fast 
	then self.tick_interval = 30 --600
	else self.tick_interval = 600
	end
	self.next_tick = 0
	self.chunk_count = 0
	
	self.childNodes = new.array_simple[1]()
	self.to_gen = {}
	self.to_gen.total = 0
	self.to_gen.per_chunk = 0.1


	--gen some to accelerate the early game.
	self.earlygame_sources = {}
	for i = 1,5
	do
		local ctor_function = new.bitore_moving_source[0]:get_rand()
		local new_resource = ctor_function{surface = game.surfaces[1], position = new.vector_2d[1](math.random(50)-25, math.random(50)-25)}
		self.earlygame_sources[i] = new_resource
	end



	--self.index_to_name = {
	--	"small-biter" ,
	--	"medium-biter" ,
	--	"big-biter" ,
	--	"behemoth-biter" ,
	--	"small-spitter" ,
	--	"medium-spitter" ,
	--	"big-spitter" ,
	--	"behemoth-spitter" ,
	--	"biter-spawner" ,
	--	"spitter-spawner" ,
	--	"small-worm-turret" ,
	--	"medium-worm-turret" ,
	--	"big-worm-turret" ,
	--	"behemoth-worm-turret" ,
	--	"coal" ,
	--	"stone" ,
	--	"iron-ore" ,
	--	"copper-ore" ,
	--	"uranium-ore" ,
	--	"crude-oil" ,
	--	"tree-01" ,
	--	"rock-big"}

	setmetatable(self, mt.bitore_tick_container)
	return self
end
function bitore_tick_container:destroy()
	--for k,v in pairs(self.childNodes)
	--do	v = nil
	--end
	self = nil
end

--------------    MT    ----------------
--------------    MT    ----------------
--------------    MT    ----------------
mt = mt or {}
mt.bitore_tick_container = {}
mt.bitore_tick_container.__newindex = function()end
mt.bitore_tick_container.__index = bitore_tick_container

--------------    STATIC    ----------------
--------------    STATIC    ----------------
--------------    STATIC    ----------------
--static = static or {}
--static.bitore_tick_container.FUNCTION_NAME_HERE = function()
--	...
--end