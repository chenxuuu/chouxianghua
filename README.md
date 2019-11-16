# chouxianghua

抽象话生成器，一键生成抽象话

[https://qq.papapoi.com/cxh](https://qq.papapoi.com/cxh)

## 搭建

接口运行环境为openresty，lua脚本在`lua`文件夹中

更改`run.lua`第一行文件位置为你文件夹的路径

在`openresty`配置里加上你lua文件的指向配置：

```nginx
#抽象话
location /chouxiang {
    default_type text/plain;
    content_by_lua_file /www/wwwroot/qq.papapoi.com/chouxiang/run.lua;
}
```

把`index.html`里的`https://qq.papapoi.com/ibxdhw`改成自己的接口链接

直接访问`index.html`即可

## 词库

欢迎完善
