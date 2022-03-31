'use strict';
module.exports = app => {
    const { STRING, INTEGER } = app.Sequelize;
    const DescribeList = app.model.define('describeList', {
        id: { type: INTEGER(11), primaryKey: true },
        content: STRING(255),
    }, {
        timestamps: false, //自动增加创建时间
        tableName: 'describeList' //设置表名称
    });
    return DescribeList;
};

