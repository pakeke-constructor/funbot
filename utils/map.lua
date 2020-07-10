


local function get(map,x,y)
    return map[x][y]
end


local function set(map,x,y,val)
    map[x][y] = val
end


local function addBot(map, BOT, x, y)
    BOT.x = x
    BOT.y = y
end




local mt = {__index = function(t,k)t[k] = {} return t[k] end}

local function newMap()
    local map  = setmetatable({ }, mt)

    map.get    = get
    map.set    = set
    map.width  = 0
    map.height = 0
    map.addBot = addBot

    return map
end




return newMap

