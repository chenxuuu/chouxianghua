--抽象话
local emoji = require("emoji")
local pinyin = require("pinyin")

local function utf8ToTable(str)
    local tab = {}
    for uchar in string.gmatch(str, "[%z\1-\127\194-\244][\128-\191]*") do
        tab[#tab + 1] = uchar
    end
    return tab
end

local function getpinyin(s)
    return table.concat(pinyin(s,true,true))
end

return function(s)
    local data = utf8ToTable(s)
    local now = 1
    local result = {}
    while now <= #data do
        if now < #data and data[now]:len() > 1 and emoji[getpinyin(data[now]..data[now+1])] then
            table.insert(result,emoji[getpinyin(data[now]..data[now+1])])
            now = now + 2
        elseif emoji[getpinyin(data[now])] and data[now]:len() > 1 then
            table.insert(result,emoji[getpinyin(data[now])])
            now = now + 1
        else
            table.insert(result,data[now])
            now = now + 1
        end
    end
    return table.concat(result)
end
