local print, clock, format = print, os.clock, string.format

local concat = table.concat
local start, en

for _ = 1, 10 do
	start = clock()
	local s = ''
	for i = 1, 100000 do
		s = s .. 'a'
	end
	en = clock()
	print(format('operator ..: %.03f', en - start))

	start = clock()
	local s = {}
	for i = 1, 100000 do
		s[i] = 'a'
	end
	s = concat(s)
	en = clock()
	print(format('table.concat: %.03f', en - start))
	
	print()
end
