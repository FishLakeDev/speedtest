local print, clock, format = print, os.clock, string.format

local insert = table.insert
local start, en, a

for _ = 1, 10 do
	a = nil
	start = clock()
	a = {}
	for i = 1, 10000000 do
		a[i] = i
	end
	en = clock()
	print(format('a[i]: %.03f', en - start))

	a = nil
	start = clock()
	a = {}
	for i = 1, 10000000 do
		a[#a + 1] = i
	end
	en = clock()
	print(format('a[#a + 1]: %.03f', en - start))

	a = nil
	start = clock()
	a = {}
	for i = 1, 10000000 do
		insert(a, i)
	end
	en = clock()
	print(format('table.insert: %.03f', en - start))

	print()
end
