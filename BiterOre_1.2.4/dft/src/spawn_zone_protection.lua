require("vector_2d")

static = static or {}
static.spawn_zone_protection = {}
static.spawn_zone_protection.move_away = function (vector_2d, distance, max_loop_count, multiplier)
	max_loop_count = max_loop_count or 20
	multiplier = multiplier or 1.5
	local dist_sqr = distance * distance
	for i = 1, max_loop_count
	do
		if vector_2d[1]<0 then vector_2d[1] = vector_2d[1] -1 else vector_2d[1] = vector_2d[1] +1 end
		if vector_2d[2]<0 then vector_2d[2] = vector_2d[2] -1 else vector_2d[2] = vector_2d[2] +1 end
		vector_2d = vector_2d * multiplier
		if vector_2d:length_sqr()> dist_sqr
		then break
		end
	end
	return vector_2d
end







