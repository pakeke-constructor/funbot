





local PATH = "primes._bot"

local pause_duration = 0






























require("commands.COMMANDS")



io.open('DEBUG.txt','w'):close()
-- HOMEMADE PRINT
function _G.show(...)
    local t = {...}
    local f = io.open('DEBUG.txt', 'a')
    for _,v in ipairs(t) do f:write('\n  ' .. tostring(v)); print(tostring(v)) end
    f:close( )
end

function string:at(i)
    return self:sub(i,i)
end

local each = function(str)
    assert(type(str) == "string", "Not string!")
    local len = str:len()
    local cur = 0

    return function ()
        if (cur + 1) > len then
            return nil
        end
        cur = cur + 1
        return str:sub(cur, cur)
    end
end
--[[

]]



--[[


]]
local BOT = require("bot")
local command = require("commands.command")
local Map = require("utils.map")
local inspect = require("inspect")

local map
function love.load()

    map = Map( )

    local y = 1
    for line in io.lines(PATH) do
        if not (line:at(1) == "`") then
            -- is not a comment:
            local x = 1
            for char in each(line) do
                if char == "@" then
                    local bot = BOT:new(x,y)
                    map:addBot(bot,x,y)
                else
                    map:set(x,y,char)

                end
                x = x + 1
                map.width = math.max(map.width, x)
            end
            y = y + 1
            map.height = math.max(map.height, y)
        end
    end
end





local is_paused = true
local ctr = 1

function love.update(dt)
    if not is_paused then
        is_paused = true
        ctr = pause_duration
        for _,b in ipairs(BOT.bots) do
            b:update()
            local char = map[b.x][b.y]

            local cmd = command.commands[char]
            if cmd then
                cmd(b, map)
            end
        end
    else
        ctr = ctr - dt
        if ctr < 0 then
            is_paused = false
        end
    end
end





local lg = love.graphics

function love.draw()
    lg.translate(100,100)
    lg.setColor(1,1,1)

    local mx, my =  math.floor(love.mouse.getX()/10)*10 - 100, math.floor(love.mouse.getY()/10)*10 - 100
    love.graphics.rectangle("line", mx, my+2, 10,10)

    for y=1,map.height do
        for x = 1, map.width do
            if map[x][y] then
                lg.print(map[x][y], x*10,y*10)
            end
        end
    end
    lg.setColor(1,0,0)
    for _, b in ipairs(BOT.bots) do
        lg.print("@",(b.x*10)-2, (b.y*10)-1)
        for q,val in ipairs(b.stack) do
            lg.print(tostring(val), love.graphics.getWidth()-100, (q*10) + 50)
        end
    end
end



--[[
function love.keypressed()
    show(inspect(map))
end
]]
