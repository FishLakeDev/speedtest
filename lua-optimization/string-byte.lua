local print, clock, format = print, os.clock, string.format

local byte = string.byte
local start, en

local bytes = {}
for i = 0, 255 do
	bytes[i] = byte(i)
end

for _ = 1, 10 do
	start = clock()
	for i = 0, 100000000 do
		local x = byte('a')
	end
	en = clock()
	print(format('byte(): %.03f', en - start))

	start = clock()
	for i = 1, 100000000 do
		local x = bytes['a']
	end
	en = clock()
	print(format('bytes[]: %.03f', en - start))

	print()
end
