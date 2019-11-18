package.path = package.path..";/www/wwwroot/qq.papapoi.com/chouxiang/?.lua"

--如果有post，那就是telegram请求
local status, postData= pcall(function()
    ngx.req.read_body()
    return ngx.req.get_body_data()
end)
if status and postData and false then--想打开telegram机器人功能，就把这里的false去掉
    function string.utf8ToTable(str)
        local tab = {}
        for uchar in string.gmatch(str, "[%z\1-\127\194-\244][\128-\191]*") do
            tab[#tab + 1] = uchar
        end
        return tab
    end
    function urlEncode(str)
        local t = str:utf8ToTable()
        for i = 1, #t do
            if #t[i] == 1 then
                t[i] = string.gsub(string.gsub(t[i], "([^%w_%*%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end), " ", "+")
            else
                t[i] = string.gsub(t[i], ".", function(c) return string.format("%%%02X", string.byte(c)) end)
            end
        end
        return table.concat(t)
    end

    local JSON = require("JSON")
    local tgmsg = JSON:decode(postData)
    local ix = require("chouxiang")
    local res = ix(tgmsg.inline_query.query)
    local response = JSON:encode({
            {
                ["type"] = "article",
                id = "001",
                title = "你要的抽象话",
                description = res:sub(1,15),
                input_message_content = {
                    message_text = res,
                },
            },
        })
    local hc = require('httpclient').new()
    --key换成自己的
    local res = hc:get("https://api.telegram.org/bot改成你的key/answerInlineQuery?inline_query_id="..tgmsg.inline_query.id.."&results="..urlEncode(response))
    if not res.body then
        ngx.say([[{"error":"]]..res.err..[["}]])
    else
        ngx.say(res.body)
    end
    return
end
--telegram机器人功能结束

local s = ngx.req.get_uri_args()["s"]
if not s or s:len() == 0 then
    ngx.say("请输入要转换的话")
    return
end
local ix = require("chouxiang")
ngx.say(ix(s))
