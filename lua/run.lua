package.path = package.path..";/www/wwwroot/qq.papapoi.com/chouxiang/?.lua"
local s = ngx.req.get_uri_args()["s"]
if not s or s:len() == 0 then
	ngx.say("请输入要转换的话")
	return
end
local ix = require("chouxiang")
ngx.say(ix(s))
