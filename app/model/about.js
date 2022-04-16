'use strict';
module.exports = app => {
  const { STRING, INTEGER } = app.Sequelize;
  const aboutList = app.model.define('about', {
    id: { type: INTEGER(11), primaryKey: true },
    content: STRING(10485700),
    isme: STRING(255),
  },
  {
    timestamps: false, // 自动增加创建时间
    tableName: 'about', // 设置表名称
  });
  return aboutList;
};

