

local Stack = require("utils.stack")


local BOT = { bots = {} }

local hash = { }

function BOT:update(dt)
    self.x = self.x + self.vx
    self.y = self.y + self.vy
end

function BOT:new(_, x,y)
    local bot = {
        x = x,
        y = y,

        vx = 0,
        vy = -1,

        update = BOT.update,

        stack = Stack( ),
        hash  = hash,
        bool = true
    }
    table.insert(BOT.bots, bot)

    return bot
end





return BOT

