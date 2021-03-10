static = static or {}
static.dft_util = {}

static.dft_util.another_index = function ( total_index, old_index )
	local result = math.random(total_index-1)
	if result >= old_index 
	then result = result+1
	end
	return result
end

static.dft_util.lerp = function (a,b,t)
	return a*(1-t)+b*t
end
static.dft_util.reverse_lerp = function (a,b, value)
	return (value-a)/(b-a)
end
static.dft_util.clamp = function (value, min,max)
	return math.min(max,math.max(min, value))
end

static.dft_util.random_choose = function (table)
	return table[math.random(#table)]
end

