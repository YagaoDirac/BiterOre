--------------    GVV    ----------------
remote.add_interface("__"..script.mod_name.."__gvv",{global=function() return global end, _G=function() local G,_,j,s,cp=_G,true,0,{} local B={_G=_,assert=_,collectgarbage=_,error=_,getmetatable=_,ipairs=_,load=_,loadstring=_,next=_,pairs=_,pcall=_,print=_,rawequal=_,rawlen=_,rawget=_,rawset=_,select=_,setmetatable=_,tonumber=_,tostring=_,type=_,xpcall=_,_VERSION=_,unpack=_,table=_,string=_,bit32=_,math=_,debug=_,serpent=_,log=_,localised_print=_,table_size=_,package=_,require=_,global=_,remote=_,commands=_,settings=_,rcon=_,rendering=_,script=_,defines=_,game=_,} local N={LuaGameScript=_,LuaBootstrap=_,LuaRemote=_,LuaCommandProcessor=_,LuaSettings=_,LuaRCON=_,LuaRendering=_,LuaLazyLoadedValue=_,LuaCustomTable=_,LuaDifficultySettings=_,LuaFlowStatistics=_,} cp=function(o,p,a) local t,r=type(o) if t=='table' and type(o.__self)=='userdata' and o.object_name then if a or (N[o.object_name] or o.object_name:match('^LuaMapSettings')) then j=j+1 r='<'..o.object_name..j..'>' else r=o end elseif t=='table' then if a then j=j+1 r='<table'..j..'>' else local c for k,v in pairs(p) do if v==o then c=true break end end if c then r='<recursive table>' else r={} local q={} for k,v in pairs(p) do q[k]=v end q[#q+1]=o for k,v in next,o,nil do r[cp(k,q,true)]=cp(v,q) end end end elseif t=='function' or t=='userdata' or t=='thread' or t=='nil' then if a then j=j+1 r='<'..t..j..'>' else r='<'..t..'>' end else r=o end return r end for k,v in pairs(G) do if not B[k] then s[cp(k,{_G},true)]=cp(v,{_G}) end end return s end, diag=function() local rm,po,mt,c,e,p,l,j,it={},{},{},0,0,0,0,0 local du=function(b,m) local n={} for i,v in ipairs(b) do n[#n+1]=v end n[#n+1]=m return n end local va=function(v) local s,a=pcall(function()return v.valid end) if s then return a else return end end local u={LuaGameScript=true,LuaBootstrap=true,LuaRemote=true,LuaCommandProcessor=true,LuaSettings=true,LuaRCON=true,LuaRendering=true,LuaLazyLoadedValue=true} it=function(b,pth,o) local t, y for k,v in pairs(b) do t=type(k) y=type(v) if t=='function' or t=='userdata' or t=='thread' or y=='function' or y=='userdata' or y=='thread' then if o then return true else if t=='string' or t=='number' or t=='boolean' then rm[#rm+1]=du(pth,k) e=e+1 elseif t=='table' and getmetatable(k)=='private' and k.object_name then j=j+1 rm[#rm+1]=du(pth,k.object_name..j) e=e+1 else j=j+1 rm[#rm+1]=du(pth,t..j) e=e+1 end end elseif t=='nil' then if o then if y=='table' and getmetatable(v)=='private' and v.object_name then if u[v.object_name] then return true else return false end elseif y=='table' then return it(v,nil,true) end else j=j+1 rm[#rm+1]=du(pth,t..j) e=e+1 end elseif t=='table' and getmetatable(k)=='private' and k.object_name then if o then if u[k.object_name] then return true end else if va(k) and not u[k.object_name] then if y=='table' and getmetatable(v)=='private' and v.object_name then if u[v.object_name] then j=j+1 rm[#rm+1]=du(pth,k.object_name..j) e=e+1 else j=j+1 po[#po+1]=du(pth,k.object_name..j) p=p+1 end elseif y=='table' and getmetatable(v) then j=j+1 po[#po+1]=du(pth,k.object_name..j) p=p+1 mt[#mt+1]=du(pth,k.object_name..j) l=l+1 it(v,du(pth,k.object_name..j)) elseif y=='table' then j=j+1 po[#po+1]=du(pth,k.object_name..j) p=p+1 it(v,du(pth,k.object_name..j)) else j=j+1 po[#po+1]=du(pth,k.object_name..j) p=p+1 end elseif u[k.object_name] then j=j+1 rm[#rm+1]=du(pth,k.object_name..j) e=e+1 else j=j+1 rm[#rm+1]=du(pth,k.object_name..j) e=e+1 end end elseif t=='table' then if o then return it(k,nil,true) else if it(k,nil,true) then j=j+1 rm[#rm+1]=du(pth,t..j) e=e+1 else if y=='table' and getmetatable(v)=='private' and v.object_name then if u[v.object_name] then j=j+1 rm[#rm+1]=du(pth,t..j) e=e+1 else j=j+1 po[#po+1]=du(pth,t..j) p=p+1 end elseif y=='table' and getmetatable(v) then j=j+1 po[#po+1]=du(pth,t..j) p=p+1 mt[#mt+1]=du(pth,t..j) l=l+1 it(v,du(pth,t..j)) elseif y=='table' then j=j+1 po[#po+1]=du(pth,t..j) p=p+1 it(v,du(pth,t..j)) else j=j+1 po[#po+1]=du(pth,t..j) p=p+1 end end end elseif y=='table' and getmetatable(v)=='private' and v.object_name then if u[v.object_name] then if o then return true else rm[#rm+1]=du(pth,k) e=e+1 end elseif o then else c=c+1 end elseif y=='table' then if o then return it(v,nil,true) elseif getmetatable(v) then mt[#mt+1]=du(pth,k) l=l+1 it(v,du(pth,k)) else it(v,du(pth,k)) c=c+1 end elseif o then else c=c+1 end end end it(global,{}) return {trouble=rm,meta=mt,m_count=l,n_count=c,e_count=e,potential=po,p_count=p} end, fix=function() local rm,po,mt,c,e,p,l,j,it={},{},{},0,0,0,0,0 local du=function(b,m) local n={} for i,v in ipairs(b) do n[#n+1]=v end n[#n+1]=m return n end local va=function(v) local s,a=pcall(function()return v.valid end) if s then return a else return end end local u={LuaGameScript=true,LuaBootstrap=true,LuaRemote=true,LuaCommandProcessor=true,LuaSettings=true,LuaRCON=true,LuaRendering=true,LuaLazyLoadedValue=true} it=function(b,pth,o) local t, y for k,v in pairs(b) do t=type(k) y=type(v) if t=='function' or t=='userdata' or t=='thread' or y=='function' or y=='userdata' or y=='thread' then if o then return true else if t=='string' or t=='number' or t=='boolean' then rm[#rm+1]=du(pth,k) b[k]=nil e=e+1 elseif t=='table' and getmetatable(k)=='private' and k.object_name then j=j+1 rm[#rm+1]=du(pth,k.object_name..j) b[k]=nil e=e+1 else j=j+1 rm[#rm+1]=du(pth,t..j) b[k]=nil e=e+1 end end elseif t=='nil' then if o then if y=='table' and getmetatable(v)=='private' and v.object_name then if u[v.object_name] then return true else return false end elseif y=='table' then return it(v,nil,true) end else j=j+1 rm[#rm+1]=du(pth,t..j) b[k]=nil e=e+1 end elseif t=='table' and getmetatable(k)=='private' and k.object_name then if o then if u[k.object_name] then return true end else if va(k) and not u[k.object_name] then if y=='table' and getmetatable(v)=='private' and v.object_name then if u[v.object_name] then j=j+1 rm[#rm+1]=du(pth,k.object_name..j) b[k]=nil e=e+1 else j=j+1 po[#po+1]=du(pth,k.object_name..j) p=p+1 end elseif y=='table' and getmetatable(v) then j=j+1 po[#po+1]=du(pth,k.object_name..j) p=p+1 mt[#mt+1]=du(pth,k.object_name..j) l=l+1 it(v,du(pth,k.object_name..j)) elseif y=='table' then j=j+1 po[#po+1]=du(pth,k.object_name..j) p=p+1 it(v,du(pth,k.object_name..j)) else j=j+1 po[#po+1]=du(pth,k.object_name..j) p=p+1 end elseif u[k.object_name] then j=j+1 rm[#rm+1]=du(pth,k.object_name..j) b[k]=nil e=e+1 else j=j+1 rm[#rm+1]=du(pth,k.object_name..j) b[k]=nil e=e+1 end end elseif t=='table' then if o then return it(k,nil,true) else if it(k,nil,true) then j=j+1 rm[#rm+1]=du(pth,t..j) b[k]=nil e=e+1 else if y=='table' and getmetatable(v)=='private' and v.object_name then if u[v.object_name] then j=j+1 rm[#rm+1]=du(pth,t..j) b[k]=nil e=e+1 else j=j+1 po[#po+1]=du(pth,t..j) p=p+1 end elseif y=='table' and getmetatable(v) then j=j+1 po[#po+1]=du(pth,t..j) p=p+1 mt[#mt+1]=du(pth,t..j) l=l+1 it(v,du(pth,t..j)) elseif y=='table' then j=j+1 po[#po+1]=du(pth,t..j) p=p+1 it(v,du(pth,t..j)) else j=j+1 po[#po+1]=du(pth,t..j) p=p+1 end end end elseif y=='table' and getmetatable(v)=='private' and v.object_name then if u[v.object_name] then if o then return true else rm[#rm+1]=du(pth,k) b[k]=nil e=e+1 end elseif o then else c=c+1 end elseif y=='table' then if o then return it(v,nil,true) elseif getmetatable(v) then mt[#mt+1]=du(pth,k) l=l+1 it(v,du(pth,k)) else it(v,du(pth,k)) c=c+1 end elseif o then else c=c+1 end end end it(global,{}) return {trouble=rm,meta=mt,m_count=l,n_count=c,e_count=e,potential=po,p_count=p} end, c=function(t,...) local i=#global+1 global[i]=table.pack(...) local m=setmetatable({},global[i]) local pc,ret=pcall(function() assert(loadstring('local arg=global['..i..'] global['..i..']=nil '..t))() end) if not pc then if getmetatable(m)==global[i] then global[i]=nil end end return pc,ret end, version=function() return '5' end, })

--------------   CONFIG  ----------------
require "config"

--------------    DFT    ----------------
require "dft.src.control"

--------------  INCLUDE  ----------------
require "src.control"

--------------  GLOBAL   ----------------
bitore_tick_container_for_main_surface = nil

-------------- CALL BACK ----------------
script.on_event(defines.events.on_chunk_generated, function(event)
      --log(serpent.block(event))

   if math.abs(event.position.x)>100 or math.abs(event.position.y)>100
   then
      --game.print("TOOOOOOOOOOOOOOOOOO FAAAAAAAAAAAAAAAAAAAAAAAAARRRRRRR")
      local void_tiles = {}
      local index = 1
      for x = event.area.left_top.x, event.area.right_bottom.x - 1 
      do
         for y = event.area.left_top.y, event.area.right_bottom.y - 1 
         do
            void_tiles[index] = {name = "out-of-map", position = {x,y}}
            index = index + 1
         end
      end
      game.surfaces[1].set_tiles(void_tiles)
      return 
   end


   bitore_tick_container_for_main_surface:on_chunk_generated(event)

   local auto_gen_resource = event.surface.find_entities_filtered{area = event.area, type = "resource"}
   for k,v in pairs(auto_gen_resource)
   do v.destroy()
   end
   local auto_gen_enemy = event.surface.find_entities_filtered{area = event.area, force = "enemy"}
   for k,v in pairs(auto_gen_enemy)
   do
      if v.name == "biter-spawner" or 
         v.name == "spitter-spawner" or 
         v.name == "small-worm-turret" or
         v.name == "medium-worm-turret" or
         v.name == "big-worm-turret" or 
         v.name == "behemoth-worm-turret" 
      then v.destroy()
      end
   end
   local auto_gen_tree = event.surface.find_entities_filtered{area = event.area, type = "tree"}
   for k,v in pairs(auto_gen_tree)
   do 
      v.destroy()
   end
   local auto_gen_simple_entity = event.surface.find_entities_filtered{area = event.area, type = "simple-entity"}
   for k,v in pairs(auto_gen_simple_entity)
   do 
      v.destroy()
   end


end)







script.on_event(defines.events.on_tick, function(event)
   if game.tick == 0 
   then
      if __DEBUG_game_speed then game.speed = __DEBUG_game_speed end

      --game.surfaces[1].map_gen_settings.autoplace_controls["coal"] = {frequency = 1, richness = 1, size= 0}
      --game.surfaces[1].map_gen_settings.autoplace_settings["deepwater"] ={treat_missing_as_default = false, settings = {frequency = 0, richness = 0, size = 0}} 
      
      --bitter_ore_persurface_manager_for_main_surface = new.bitter_ore_persurface_manager[1]{surface = game.surfaces[1]}--["nauvis"])

      if __DEBUG_god_mode_yagaodirac and game.players[1].name == "YagaoDirac"
      then game.players[1].character = nil
      end

      if __DEBUG then game.print("This is debug mode. Please comment to mods.factorio.com/mod/BiterOre/discussion . THe author released this scenario with debug mode on by mistake. Actually this guy has done this before for quite some times.") 
      end

      bitore_tick_container_for_main_surface = new.bitore_tick_container[1]{surface = game.surfaces[1]}
   end
   bitore_tick_container_for_main_surface:tick()



   if __DEBUG_fast_chart
   then
      if game.tick == 220 
      then
         game.players[1].force.chart(game.players[1].surface,
                        {{x = -__DEBUG_fast_chart, y = -__DEBUG_fast_chart}, {x = __DEBUG_fast_chart, y = __DEBUG_fast_chart}})
      end
   end

   if __DEBUG_log_to_yagaodirac
   then
      if game.tick % 1800 == 0
      then 
         for k,v in pairs(game.players)
         do
            if "YagaoDirac" == v.name
            then 
               --v.set_quick_bar_slot(10, "coal")
               --local to_print = v.get_quick_bar_slot(10).name
               local yagao_quick_bar_10 = v.get_quick_bar_slot(10)
               if yagao_quick_bar_10 and yagao_quick_bar_10.name == "coal"
               then log("Log info WIP.")
               else v.print("Set quick bar 10 to coal to get log info.")
               end
            end
         end
      end
   end


   local beishu = 20
   if true 
   then

      if game.tick< 1000 * beishu
      then 
         for k,v in pairs(game.players)
         do
            if v.character 
            then
               v.character.active = false
            end
         end
         game.speed = 100

         if game.tick%(100 * beishu) == 0 
         then
            local str_to_print = "Preparing, please wait "
            for i = 1, game.tick/(100 * beishu)
            do
               str_to_print = str_to_print .. "|"
            end
            for i = game.tick/(100 * beishu), 9
            do
               str_to_print = str_to_print .. "."
            end
            game.print(str_to_print)
         end
      end

      if game.tick== 1 
      then
         game.players[1].force.chart(game.players[1].surface, {{x = -500, y = -500}, {x = 500, y = 500}})
      end

      if game.tick == 1000 *  beishu+1
      then
         for k,v in pairs(game.players)
         do
            if v.character 
            then
               v.character.active = true
            end
         end
         game.speed = 1
         game.players[1].force.chart(game.players[1].surface, {{x = -500, y = -500}, {x = 500, y = 500}})

         game.print("Preparing, please wait ||||||||||")
         game.print("Preparation finished. Good luck. Have fun.")
      end
   end






   --if game.tick == 10 
   --then
   --   if __DEBUG 
   --   then       
   --      local res = game.surfaces[1].create_entity{name = "coal", position = {5,0}, amount= 100}	
   --      dddddddddd = res
   --      --if res.minable_properties 
   --      --then game.print(321321312)
   --      --end
   --      -- to do 一个很重要的测试
   --      game.surfaces[1].create_entity{name = "crude-oil", position = {5,5}, amount= 30000}	
   --   end
   --end

end)



--function player_respawn(index)
--   local p = game.players[index]
--   p.teleport(main_surface, {0,0})
--end
--
--script.on_event(defines.events.on_player_joined_game, function(event)
--   game.print("on_player_joined_game")
--   --player_respawn(event.player_index)
--end)
--script.on_event(defines.events.on_player_respawned, function(event)
--   game.print("on_player_respawned")
--
--   --player_respawn(event.player_index)
--end)
--script.on_event(defines.events.on_player_created, function(event)
--   game.print("on_player_created")
--end)
--script.on_event(defines.events.on_player_died, function(event)
--   game.print("on_player_died")
--end)
--script.on_event(defines.events.on_player_left_game, function(event)
--   game.print("on_player_left_game")
--end)
--on_player_created 不清楚
--on_player_died
--on_player_left_game



