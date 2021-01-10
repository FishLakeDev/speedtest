local print, clock, format = print, os.clock, string.format

local char = string.char
local start, en

local chars = {}
for i = 0, 255 do
	chars[i] = char(i)
end

for _ = 1, 10 do
	start = clock()
	for i = 0, 100000000 do
		local x = char(97)
	end
	en = clock()
	print(format('char(): %.03f', en - start))

	start = clock()
	for i = 1, 100000000 do
		local x = chars[97]
	end
	en = clock()
	print(format('chars[]: %.03f', en - start))

	print()
end
