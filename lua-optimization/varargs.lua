local print, clock, format = print, os.clock, string.format

local select, pack = select, table.pack
local start, en

local function tab(...)
	local va = { ... }
	local len = #va
	local sec = va[2]
end

local function sel(...)
	local len = select('#', ...)
	local sec = select(2, ...)
end

local function tab_pack(...)
	local va = pack(...)
	local len = va.n
	local sec = va[2]
end

for _ = 1, 10 do
	start = clock()
	for l = 1, 1000000 do
		tab(1, "asd", "Dfhd", print, 0xaa)
	end
	en = clock()
	print(format('table: %.03f', en - start))

	start = clock()
	for l = 1, 1000000 do
		sel(1, "asd", "Dfhd", print, 0xaa)
	end
	en = clock()
	print(format('select: %.03f', en - start))
	
	if pack ~= nil then
		start = clock()
		for l = 1, 1000000 do
			tab_pack(1, "asd", "Dfhd", print, 0xaa)
		end
		en = clock()
		print(format('table.pack: %.03f', en - start))
	end

	print()
end
