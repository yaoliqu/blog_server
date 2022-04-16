'use strict';
module.exports = app => {
  const { STRING, INTEGER } = app.Sequelize;
  const sayList = app.model.define('say', {
    id: { type: INTEGER(11), primaryKey: true },
    content: STRING(255),
    date: STRING(255),
    isshow: INTEGER(11),
  },
  {
    timestamps: false, // 自动增加创建时间
    tableName: 'say', // 设置表名称
  });
  return sayList;
};

