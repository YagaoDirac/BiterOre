__DEBUG_log_to_yagaodirac = true


--__DEBUG = true --comment this line
--like this:
--__DEBUG = true

if __DEBUG
then
	
	__DEBUG_names = {"yagaodirac"}
	--If you don't comment this line out, you may have to start the server with this name.
	--So, the best choice is to simply comment this line as well like:
	--__DEBUG_names = {"yagaodirac"}


	--__DEBUG_single_source = true

	--__DEBUG_fast = true




	__DEBUG_game_speed = 60
	--__DEBUG_fast_chart = 444
	__DEBUG_god_mode_yagaodirac = true 

end


--This part is copied from a mod of mine. Not in use for this scenario.
--config = {}
--config.ROOT_PATH = "__Dirac-prototype-lib__/"
--return config