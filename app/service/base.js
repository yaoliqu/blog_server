// app/service/base.js

'use strict';
const {
  Op,
} = require('sequelize');
const Service = require('egg').Service;

class BaseService extends Service {
  // 查询数据
  async _findAll(modelName, type) {
    const {
      ctx,
    } = this;
    const order = [ 'id', 'DESC' ];
    try {
      return await ctx.model[modelName].findAll({
        order: [
          type ? [ 'date', 'DESC' ] : order,
        ],
        // raw: true,
      });
    } catch (error) {
      return 'Server error';
    }
  }
  // 分组
  async _findAll_group(modelName, type) {
    const {
      ctx,
      app,
    } = this;
    try {
      return await ctx.model[modelName].findAll({
        attributes: [ type, [ app.Sequelize.fn('COUNT', app.Sequelize.col(type)), 'count' ]],
        group: type,
        raw: true,
      });
    } catch (error) {
      return 'Server error';
    }
  }
  // 查询数据总数
  async _count(modelName) {
    const {
      ctx,
    } = this;
    try {
      return await ctx.model[modelName].count();
    } catch (error) {
      return 'Server error';
    }
  }

  // 根据ID查询数据
  async _findById(modelName, id) {
    const {
      ctx,
    } = this;
    try {
      const result = await ctx.model[modelName].findByPk(id, {
        // raw: true,
        include: [
          { model: ctx.model.Tags, attributes: [ 'id', 'tag' ] },
        ],
      });
      return result;
    } catch (error) {
      return 'Server error';
    }
  }

  // 新增数据
  async _add(modelName, json) {
    const {
      ctx,
    } = this;
    try {
      await ctx.model[modelName].create(json);
      return '新增成功';
    } catch (error) {
      return 'Server error';
    }
  }

  // 编辑数据
  async _edit(modelName, json) {
    const {
      ctx,
    } = this;
    try {
      const result = await ctx.model[modelName].findByPk(json.id);
      if (!result) return false;
      await result.update({
        ...json,
      });
      return '修改成功';
    } catch (error) {
      return 'Server error';
    }
  }

  // 删除数据
  async _delete(modelName, key) {
    const {
      ctx,
    } = this;
    try {
      const result = await ctx.model[modelName].findByPk(key);
      if (!result) return false;
      await result.destroy();
      return '删除成功';
    } catch (error) {
      return 'Server error';
    }
  }


  // 根据条件查找一条数据
  async _findOne(modelName, obj = {}) {
    const {
      ctx,
    } = this;
    try {
      const result = await ctx.model[modelName].findOne({
        where: obj,
      });
      return result;
    } catch (error) {
      return 'Server error';
    }
  }
  // 条件查询
  async _findQueries(modelName, attributes = [], obj = {}) {
    const {
      ctx,
    } = this;
    try {
      const result = await ctx.model[modelName].findAll({
        attributes,
        where: obj,
        raw: true,
      });
      return result;
    } catch (error) {
      return 'Server error';
    }
  }
  // 分页查询
  async _findAllBypage(modelName, pageSize, pageNum, title, isClasses) {
    const {
      ctx,

    } = this;
    const where = {};
    if (isClasses) {
      where.classes = {
        [Op.eq]: title,
      };
    } else {
      if (title && !isClasses) {
        where.title = {
          [Op.like]: '%' + title + '%',
        };
      }
    }
    try {
      return await ctx.model[modelName].findAndCountAll({
        order: [
          [ 'id', 'DESC' ],
        ],
        include: [
          { model: ctx.model.Tags, attributes: [ 'id', 'tag' ] },
        ],
        attributes: {
          exclude: [ 'pwd' ],
        },
        where,
        limit: pageSize, // 每页多少条
        offset: pageSize * (pageNum - 1),
        // raw: true,
      });
    } catch (error) {
      return 'Server error';
    }
  }
  // 分页查询标签
  async _findAllBypage_tag(modelName, pageSize, pageNum, id) {
    const {
      ctx,
    } = this;
    try {
      const res = await ctx.model[modelName].findAndCountAll({
        // order: [
        //   [ 'id', 'DESC' ],
        // ],
        // attributes: {
        //   exclude: [ 'pwd' ],
        // },
        where: { tagid: id },
        limit: pageSize, // 每页多少条
        offset: pageSize * (pageNum - 1),
        raw: true,
      });
      const total = res.count;
      const selectId = res.rows.length ? res.rows.map(i => ({ id: i.artid })) : [];
      const data = await ctx.model.Articlelist.findAll({
        where: {
          [Op.or]: selectId },
        raw: true,
        attributes: {
          exclude: [ 'pwd' ],
        },
      });
      return {
        list: data, total, pageSize, pageNum,
      };
    } catch (error) {
      console.log(error);
      return 'Server error';
    }
  }
  // 关联关系 artTag
  async _connect() {
    const {
      ctx,
    } = this;
    ctx.model.Articlelist.belongsToMany(ctx.model.Tags, {
      through: {
        model: ctx.model.ArtTag,
        unique: false,
      },
      foreignKey: 'artid', // 经过外键postId
      constraints: false,
    });
    ctx.model.Tags.belongsToMany(ctx.model.Articlelist, {
      through: {
        model: ctx.model.ArtTag,
        unique: false,
      },
      foreignKey: 'tagid', // 经过外键tagId
      constraints: false,
    });
  }
}

module.exports = BaseService;
