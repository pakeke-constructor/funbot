


local Stack = require("stack")



return function(X,_)

    local new = {}

    for x=1,X do
        new[x] = Stack()
    end

    return new
end





