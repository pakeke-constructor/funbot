

local Stack = require("stack")


local BOT = { }


function BOT:new(_, x,y)
    local bot = {
        x = x,
        y = y,

        vx = 0,
        vy = -1,

        stack = Stack( ),
        bool = true
    }

    return bot
end





return BOT


