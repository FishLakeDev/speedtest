local XOR_KEY = 0xFF
local BUFFER_SIZE = 2048

local path = 'gta3.img'
local out = path .. '-xor'

local inf = assert(io.open(path, 'rb'))
local outf = assert(io.open(out, 'wb'))

local buff = inf:read(BUFFER_SIZE)
while buff do
	local r = {}
	for i = 1, #buff do
		r[i] = string.char(bit.bxor(buff:byte(i), XOR_KEY))
	end
	outf:write(table.concat(r))
	buff = inf:read(BUFFER_SIZE)
end

inf:close()
outf:close()
