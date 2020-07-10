



local Command = { commands = {} }




function Command:new(symbol, func)
    -- Func takes "BOT" as first argument.

    --local newC = setmetatable({symbol = symbol, func = func})

    assert(type(symbol) == "string", "Symbol was not string")
    assert(symbol:len() == 1, "Symbol length not 1")
    assert(func, "no function given!")

    Command.commands[symbol] = func
end


return setmetatable(Command, {__call = Command.new})


