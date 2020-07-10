

local Stack = {}
local Stack_mt = {__index = Stack}

function Stack:push(val)
    self.len = self.len + 1
    self[self.len] = val
end


function Stack:pop()
    local val = self[self.len]
    self[self.len] = nil
    self.len = math.max(0,self.len - 1)
    return val
end

function Stack:new(tabl)
    local stack = setmetatable({len = 0}, Stack_mt)

    for _,v in ipairs(tabl or {}) do
        self:add(v)
    end

    return stack
end


return setmetatable(Stack, {__call = Stack.new})

