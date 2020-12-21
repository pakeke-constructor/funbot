# funbot
lightweight esoteric programming language based on befunge

Rules:
```
@ is a bot, runs commands. Bots will always start moving upwards

bot = {
    stack = Stack( )
    bool  = true
    hash  = { }
}
each bot has a stack, a boolean pocket, and a hashtable




any lowercase alphabet character is a label, except v

any uppercase alphabet character is a teleporter, except V


=  pops 2 values off stack,  bot.hash[bottom] = top.
    pushes top value back onto stack.

v  turn bot down (V also works)
>  turn bot right
<  turn bot left
^  turn bot up

"   outputs top stack value to  `print`
'   converts top stack value to string, if possible

&   character/string concatenation. Takes top 2 values, and concatenates them

$   swaps top 2 stack values

        Each operator pops the top two values off the stack, and pushes the result onto the stack.
        If not correct type, nothing happens
*   times operator
/   division
\   floor
-   minus
+   plus
!   power
%   modulus


?   pops 1 value off stack, gets hashtable value for popped value.


(   turns bot 1 unit clockwise
)   turns bot 1 unit anticlockwise

[   duplicates top stack value
]   pops top stack value


`   starts a comment- must be used as first character on line!!!


:   equality check (==) (takes top 2 stack values)
.   sets boolean pocket value (pops 1 off stack)
;   same as lua < operator. returns true or false
,   boolean `NOT` operator. pops and pushes a value onto stack


|   lets left-right travelling bots through ONLY if bool pocket == true. Else, bots bounce off

_   lets up-down travelling bots through ONLY if bool pocket == true. Else, bots bounce off
```
