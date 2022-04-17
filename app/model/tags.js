'use strict';
module.exports = app => {
  const { STRING, INTEGER } = app.Sequelize;
  const tagslist = app.model.define('tagslist', {
    id: { type: INTEGER(11), primaryKey: true, autoIncrement: true },
    tag: STRING(255),
  }, {
    timestamps: false, // 自动增加创建时间
    tableName: 'tagslist', // 设置表名称
  });
  tagslist.associate = function() {
    app.model.Tags.belongsToMany(app.model.Articlelist, {
      through: app.model.ArtTag,
      foreignKey: 'tagid', // 注意写法
      otherKey: 'artid',
      constraints: false,
    });
  };
  return tagslist;
};

