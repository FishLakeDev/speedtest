local print, clock, format = print, os.clock, string.format

local pairs, ipairs, next, maxn = pairs, ipairs, next, table.maxn
local start, en

local a = {}
for i = 1, 100000000 do
	a[i] = i
end

for _ = 1, 10 do
	start = clock()
	for i = 1, #a do
		local x = a[i]
	end
	en = clock()
	print(format('#a: %.03f', en - start))

	start = clock()
	for i, k in ipairs(a) do
		local x = k
	end
	en = clock()
	print(format('ipairs: %.03f', en - start))

	start = clock()
	for i, k in pairs(a) do
		local x = k
	end
	en = clock()
	print(format('pairs: %.03f', en - start))

	if maxn ~= nil then
		start = clock()
		for i = 1, maxn(a) do
			local x = a[i]
		end
		en = clock()
		print(format('table.maxn: %.03f', en - start))
	end

	start = clock()
	local i = nil
	repeat
		i = next(a, i)
		local x = a[i]
	until i == nil
	en = clock()
	print(format('next: %.03f', en - start))

	print()
end
