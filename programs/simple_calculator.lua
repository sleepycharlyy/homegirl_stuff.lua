-- imports
local Dia, Window = require("dialog"), require("window")
-- create window variable for later use
local win

-- initialize (run at the start of the program)
function _init()
    -- create new window
    win = Window:new()
    -- make new prompt window
    win:attach("prompt", Dia.Prompt:new("Simple Calculator", "Type in a equation (Example: 1 + 2)"))
        -- ondone function gets called when prompt is closed
        .ondone = function(prompt, input)
            if input then
                if (input ~= "") then -- check if input isnt empty
                    if(input:match("%a")) then -- check if input contains letters
                    print("Your equation can't contain letters!");
                    else
                        -- convert the input (for example 1+1) into a function
                        equals = assert(load("return (" .. input ..")"), "Your input isn't a valid equation!")
                        -- solve the function
                        result = equals();
                        -- print result
                        print("Hewwo thanks for using my Calculator!\nThe result is:\n")
                        print(tostring(input) .. " = " .. tostring(result))
                    end
                else
                    -- equation is empty
                    print("The equation can't be empty!")
                end
            else
                -- pressed "cancel"
                print("Exited the prompt!")
            end
        end
    -- make view active on window container
    view.active(win.container)
end

-- step function get's called every step
function _step(t)
    -- pass t to win:step()
    win:step(t)
end

