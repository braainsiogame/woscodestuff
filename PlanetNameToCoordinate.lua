function processcoordinate(string)
    if string.len(string) == 3 then
            a = string:sub(0, 1)
            b = string:sub(3)
    elseif string.len(string) == 4 then 
        if string:find("-") == 1 then
             a = string:sub(0, 2)
             b = string:sub(4)
        end
    elseif string.len(string) == 5 then 
        if string:find("-") == 1 then
        if string:find("-", 2) == 4 then 
            a = string:sub(0,3)
            b = string:sub(5)
        else
            a = string:sub(0, 2)
            b = string:sub(4)
        end
        elseif string:find("-") == 2 then
            a = string:sub(0, 1)
            b = string:sub(3)
        else
            a = string:sub(0,2)
            b = string:sub(4)
        end
    elseif string.len(string) == 6 then 
        if string:find("-") == 1 then
        if string:find("-", 2) == 3 then
            a = string:sub(0,2)
            b = string:sub(4)
        else 
             a = string:sub(0, 3)
             b = string:sub(5)
        end
        else
             a = string:sub(0, 2)
             b = string:sub(4)
        end
    elseif string.len(string) == 7 then 
            a = string:sub(0, 3)
            b = string:sub(5)
    else 
        a = "not a coordinate" 
        b = "not a coordinate" 
    end 
    print(a)
    print(b)
    return(tonumber(a, 36) .. ", " .. tonumber(b, 36))
    end
