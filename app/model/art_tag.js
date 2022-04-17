'use strict';
module.exports = app => {
  const { INTEGER } = app.Sequelize;
  //   const artlist = ctx.model.articlelist;
  //   const tagslist = ctx.model.tagslist;
  const art_tag = app.model.define('art_tags_min', {
    // id: { type: INTEGER(11), primaryKey: true, autoIncrement: true },
    tagid: { type: INTEGER(11), primaryKey: true },
    artid: { type: INTEGER(11), primaryKey: true },
  }, {
    timestamps: false, // 自动增加创建时间
    tableName: 'art_tags_min', // 设置表名称
  });
  //   artlist.belongsToMany(tagslist, { through: art_tag });
  //   tagslist.belongsToMany(artlist, { through: art_tag });
  return art_tag;
};

