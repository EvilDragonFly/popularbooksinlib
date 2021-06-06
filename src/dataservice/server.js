//sequelize访问数据库操作不能在client-sdie完成，必须得放在server-side完成
let http = require('http');
let util = require('util');
let qs = require('querystring');
let database = require('./sequelize')


let server = http.createServer(function(req, res) { //该函数用来创建一个HTTP服务器，并将 requestListener 作为 request 事件的监听函数。req请求对象，res响应对象

    let body = ''; // 一定要初始化为"" 不然是undefined
    req.on('data', function(data) { //Stream继承EventEmitter；stream中还有数据就触发'data'
        //alias for ：emitter.addListener(eventName,listener)
        //为req对象绑定'data' event的处理函数，（req请求得到server的回复后，req会发射事件data，内部实现）
        body += data; // 用户端传送的数据
    });
    req.on('end', function() { //stream中没有了数据，触发'end'
        console.log('message');
        console.log(body == '')
        console.log(util.inspect(body, true));
        let form = qs.parse(body); //注册界面玩家填写的账号名与密码
        console.log(form);

        (async() => {
            if (form.need == 'usersInfo') { //当页面请求用户数据时，获取用户表所有信息用于统计
                let usersInfo = await database.users.findAll()
                if (usersInfo != null) {
                    res.writeHead(200, { // 响应状态
                        "Content-Type": "application/json", // 响应数据类型
                        'Access-Control-Allow-Origin': '*' // 允许任何一个域名访问
                    });

                    res.write(JSON.stringify(usersInfo));

                    res.end();

                }
            }








        })();



    });
});

server.listen(3001);