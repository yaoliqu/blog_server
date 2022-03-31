'use strict';
module.exports = app => {
    const { STRING, INTEGER } = app.Sequelize;
    const User = app.model.define('users', {
        id: { type: STRING, primaryKey: true },
        username: { type: STRING, primaryKey: true },
        nickname: STRING(255),
        age: STRING(255),
        avatar:STRING(11),
        sex:STRING(11),
        password:STRING(255),

    }, {
        timestamps: false, //自动增加创建时间
        tableName: 'users' //设置表名称
    });
    return User;
};

