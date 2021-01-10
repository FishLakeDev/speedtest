local print, clock, format = print, os.clock, string.format

local start, en

for _ = 1, 10 do
	start = clock()
	for i = 1, 1000000000 do
		local z = 5*0.25
	end
	en = clock()
	print(format('operator *: %.03f', en - start))

	start = clock()
	for i = 1, 1000000000 do
		local z = 5/4
	end
	en = clock()
	print(format('operator /: %.03f', en - start))

	start = clock()
	for i = 1, 1000000000 do
		local z = 5*(1/4)
	end
	en = clock()
	print(format('x*(1/y): %.03f', en - start))

	print()
end
