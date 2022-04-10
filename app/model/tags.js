'use strict';
module.exports = app => {
  const { STRING, INTEGER } = app.Sequelize;
  const tagslist = app.model.define('tagslist', {
    id: { type: INTEGER(11), primaryKey: true },
    tag: STRING(255),
  }, {
    timestamps: false, // 自动增加创建时间
    tableName: 'tagslist', // 设置表名称
  });
  return tagslist;
};

