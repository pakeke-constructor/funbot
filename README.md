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




*  any digit pushes that digit onto the stack

*  any lowercase alphabet character pushes that character onto the stack, except v

*  any uppercase alphabet character is a teleporter, except V



=  pops 2 values off stack,  bot.hash[bottom] = top.
    pushes top value back onto stack.

v  turn bot down (V also works)
>  turn bot right
<  turn bot left
^  turn bot up

"   outputs top stack value to  `print` and pops
'   converts top stack value to string, if possible

&   character/string concatenation. Takes top 2 values, and concatenates them

$   swaps top 2 stack values

        Each operator pops the top two values off the stack, and pushes the result onto the stack.
        If not correct type, nothing happens
*   times operator
/   division
\   floor   (only pops 1 value!)
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
# examples:
Code examples:
For these code examples, assume the bot (@) starts by travelling right.  -->
```
@ i1= 
`sets bot.hash["i"] = 1

@ i?
`pushes onto stack bot.hash["i"]  --->  1

@ q?q?+q$=
`doubles the value of q

@ fo&o&99+1+=
`sets bot.hash["foo"] = 19


@ v              
  )| tr&u&e& "
  >  fa&l&s&e& "
` if statement. If bool pocket is true, prints "true"; else "false".
 
 
@ Q he&l&l&o &w&o&r&l&d& " Q
` repeatedly prints "helloworld"
