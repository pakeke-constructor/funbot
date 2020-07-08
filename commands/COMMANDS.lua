

local cmd = require("commands.command")

-- Character iteration function for strings
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

local topbot = function(BOT)
    local top = BOT.stack:pop()
    local bot = BOT.stack:pop()
    return top,bot
end


local labels = "abcdefghijklmnopqrstuwxyz" -- v is missing, it is an operator
local teleporters = "ABCDEFGHIJKLMNOPQRSTUWXYZ" -- V is missing, "..."

-- Regular labels
for char in each(labels) do
    cmd(char, function(BOT)
        BOT.stack:push(char)
    end)
end

-- Teleporter labels
for char in each(teleporters) do
    cmd(char, function(BOT, map)
        local char = char
        local x, y = BOT.x, BOT.y
        for Y=1,map.height do
            for X=1, map.height do
                if (map[X][Y] == char) and ((X ~= x) and (Y ~= y)) then
                    BOT.x = X
                    BOT.y = Y
                    return
                end
            end
        end
    end)
end


cmd(">", function(BOT) BOT.vx = 1; BOT.vy = 0 end)
cmd("<", function(BOT) BOT.vx = -1; BOT.vy = 0 end)
cmd("v", function(BOT) BOT.vx = 0; BOT.vy = 1 end)
cmd("V", function(BOT) BOT.vx = 0; BOT.vy = 1 end)
cmd("^", function(BOT) BOT.vx = 0; BOT.vy = -1 end)

cmd("!", function(BOT)
    -- to the power of
    local st = BOT.stack
    local top = st:pop()
    local bot = st:pop()
    st:push( bot ^ top )
end)

cmd('"', function(BOT)
    -- shows item in terminal
    show(BOT.stack:pop())
end)

cmd("'", function(BOT)
    -- converts top stack item to string.
    local q = BOT.stack:pop()
    BOT.stack:push(tostring(q))
end)

cmd("&", function(BOT)
    -- concatenates top 2 values
    local top = BOT.stack:pop()
    local bot = BOT.stack:pop()
    local new = tostring(bot) .. tostring(top)
    BOT.stack:push(new)
end)

cmd("=", function(BOT)
    local top = BOT.stack:pop()
    local bot = BOT.stack:pop()
    BOT.hash[bot] = top
    BOT.stack:push(top)
end)

cmd("*", function(BOT)
    local bot,top = topbot(BOT)
    if type(bot) == "number" and type(top) == "number" then
        BOT.stack:push(bot * top)
    end
end)

cmd("/", function(BOT)
    local bot,top = topbot(BOT)
    if type(bot) == "number" and type(top) == "number" then
        BOT.stack:push(bot / top)
    end
end)

cmd("\\", function(BOT)
    local top = BOT.stack:pop( )
    if type(top) == "number" then
        BOT.stack:push(math.floor(top))
    end
end)

cmd("-", function(BOT)
    local bot,top = topbot(BOT)
    if type(bot) == "number" and type(top) == "number" then
        BOT.stack:push(bot - top)
    end
end)

cmd("+", function(BOT)
    local bot,top = topbot(BOT)
    if type(bot) == "number" and type(top) == "number" then
        BOT.stack:push(bot + top)
    end
end)

-- power function
cmd("!", function(BOT)
    local bot,top = topbot(BOT)
    if type(bot) == "number" and type(top) == "number" then
        BOT.stack:push(bot ^ top)
    end
end)

-- mod function
cmd("%", function(BOT)
    local bot,top = topbot(BOT)
    if type(bot) == "number" and type(top) == "number" then
        BOT.stack:push(bot % top)
    end
end)

-- turning clockwise
cmd("(", function(BOT)
    local vx,vy = BOT.vx,BOT.vy

    if vx == 1 then
        -- turn down
        BOT.vx = 0
        BOT.vy = 1
    elseif vx == -1 then
        -- turn up
        BOT.vx = 0
        BOT.vy = -1
    elseif vy == 1 then
        -- turn left
        BOT.vx = -1
        BOT.vy = 0
    elseif vy == -1 then
        -- turn right.
        BOT.vx = 1
        BOT.vy = 0
    end
end)

-- turning anti clockwise
cmd(")", function(BOT)
    local vx,vy = BOT.vx,BOT.vy

    if vx == -1 then
        -- turn down
        BOT.vx = 0
        BOT.vy = 1
    elseif vx == 1 then
        -- turn up
        BOT.vx = 0
        BOT.vy = -1
    elseif vy == -1 then
        -- turn left
        BOT.vx = -1
        BOT.vy = 0
    elseif vy == 1 then
        -- turn right.
        BOT.vx = 1
        BOT.vy = 0
    end
end)

cmd("[", function(BOT)
    local dupe = BOT.stack:pop()
    BOT.stack:push(dupe)
    BOT.stack:push(dupe)
end)

cmd(":", function(BOT)
    local top,bot=topbot(BOT)
    BOT.stack:push(top==bot)
end)

cmd(".", function(BOT)
    BOT.bool = BOT.stack:pop()
end)

cmd(";", function(BOT)
    local top,bot = topbot(BOT)
    BOT.stack:push(top < bot)
end)

cmd(",", function(BOT)
    local bool = BOT.stack:pop()
    BOT.stack:push(not bool)
end)

cmd("|", function(BOT)
    if not BOT.bool then
        BOT.vx = BOT.vx * -1
    end
end)

cmd("_", function(BOT)
    if not BOT.bool then
        BOT.vy = BOT.vy * -1
    end
end)

