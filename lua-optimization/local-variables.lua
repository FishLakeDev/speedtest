local print, clock, format = print, os.clock, string.format

local sin = math.sin
local start, en

for _ = 1, 10 do
	start = clock()
	for l = 1, 100000000 do
		local x = math.sin(l)
	end
	en = clock()
	print(format('math.sin: %.03f', en - start))

	start = clock()
	for l = 1, 100000000 do
		local x = sin(l)
	end
	en = clock()
	print(format('sin: %.03f', en - start))
	
	print()
end
