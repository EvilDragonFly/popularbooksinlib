//import mysql2 from 'mysql2' //fix the problem between webpack&sequelize https://github.com/sequelize/sequelize/issues/9489#issuecomment-493304014
const mysql2 = require('mysql2') //node直接运行需要将import改为require？

//定义server与mysql交互的配置信息
var config = {
    database: 'kinectrfid',
    username: 'root',
    password: '324213',
    host: 'localhost',
    port: 3306
};

const Sequelize = require('sequelize');



console.log('init sequelize...');

var sequelize = new Sequelize(config.database, config.username, config.password, {
    host: config.host,
    dialect: 'mysql',
    pool: { //连接池设置
        max: 5, //最大连接数
        min: 0,
        idle: 30000 //断开连接后，连接实例在连接池保持的时间
    },
    dialectModule: mysql2
});

var books = sequelize.define('book', { //少个s
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    name: Sequelize.STRING(20),
    price: Sequelize.INTEGER,
    author: Sequelize.STRING(10),
    PublDate: Sequelize.DATEONLY,

    bookcode: Sequelize.INTEGER,
    descr: Sequelize.STRING(256)

}, {
    timestamps: false
});



var users = sequelize.define('user', { //少个s
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    personId: Sequelize.UUID,
    name: Sequelize.STRING(20),
    age: Sequelize.INTEGER,
    gender: Sequelize.STRING(2),
    art_value: Sequelize.INTEGER,
    religion_value: Sequelize.INTEGER,
    art_value: Sequelize.INTEGER,
    socialSci_value: Sequelize.INTEGER,
    Sci_value: Sequelize.INTEGER,
    literature_value: Sequelize.INTEGER,
    hisgeo_value: Sequelize.INTEGER,
    appliSci_value: Sequelize.INTEGER


}, {
    timestamps: false
});
//var now = Date.now();

module.exports = { books, users };