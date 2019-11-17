# chouxianghua

[https://cxh.papapoi.com/](https://cxh.papapoi.com/)

抽象话生成器，一键生成抽象话，附带telegram机器人生成抽象话功能

telegram内，@chouxiangbot即可说抽象话

## 搭建

接口运行环境为openresty，lua脚本在`lua`文件夹中

更改`run.lua`第一行文件位置为你文件夹的路径

在`openresty`配置里加上你lua文件的指向配置（需要自己改路径）：

```nginx
#抽象话
location /chouxiang {
    default_type 'text/plain';
    content_by_lua_file /www/wwwroot/qq.papapoi.com/chouxiang/run.lua;
}
```

把`index.html`里的`https://qq.papapoi.com/ibxdhw`改成自己的接口链接

直接访问`index.html`即可

## telegram机器人功能

按`run.lua`里的注释，更改相应的key和配置

在将你的机器人webhook接口改为你正在使用的网址

## 词库

欢迎完善
