'use strict';
module.exports = app => {
  const { STRING, INTEGER } = app.Sequelize;
  const saysay = app.model.define('saysay', {
    id: { type: INTEGER(11), primaryKey: true },
    content: STRING(255),
    date: STRING(255),
  }, {
    timestamps: false, // 自动增加创建时间
    tableName: 'saysay', // 设置表名称
  });
  return saysay;
};

