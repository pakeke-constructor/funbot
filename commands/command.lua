



local Command = { commands = {} }


local C_mt = {__index = Command}







function Command:new(symbol, func)
    -- Func takes "BOT" as first argument.

    local newC = setmetatable({symbol = symbol, func = func})

    assert(type(symbol) == "string", "Symbol was not string")
    assert(symbol:len() == 1, "Symbol length not 1")

    Command.commands[symbol] = func
    return newC
end


return setmetatable(Command, {__call = Command.new})


