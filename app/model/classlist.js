'use strict';
module.exports = app => {
  const { STRING, INTEGER } = app.Sequelize;
  const classifylist = app.model.define('classifylist', {
    id: { type: INTEGER(11), primaryKey: true },
    class: STRING(255),
  }, {
    timestamps: false, // 自动增加创建时间
    tableName: 'classifylist', // 设置表名称
  });
  return classifylist;
};

