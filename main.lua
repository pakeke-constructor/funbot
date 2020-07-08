

io.open('DEBUG.txt','w'):close()
-- HOMEMADE PRINT
local function show(...)
local t = {...}
local f = io.open('DEBUG.txt', 'a')
for _,v in pairs(t) do f:write('\n  ' .. tostring(v)) end
io.close(f)
end


function love.update(dt)

end



function love.draw()

end




