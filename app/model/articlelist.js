'use strict';
module.exports = app => {
  const {
    STRING,
    INTEGER,
  } = app.Sequelize;
  const Articlelist = app.model.define('articlelist', {
    id: {
      type: INTEGER(11),
      primaryKey: true,
      autoIncrement: true,
    },
    classes: STRING(255),
    content: STRING(10485700),
    date: STRING(255),
    title: STRING(255),
    url: STRING(255),
    tags: STRING(255),
    updatetime: STRING(255),
    isshow: INTEGER(11),
    pwd: STRING(255),
  }, {
    timestamps: false, // 自动增加创建时间
    tableName: 'articlelist', // 设置表名称
  });
  return Articlelist;
};
