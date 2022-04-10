// app/service/base.js

'use strict';
const { Op } = require('sequelize');
const Service = require('egg').Service;

class BaseService extends Service {
  // 查询数据
  async _findAll(modelName) {
    const {
      ctx,
    } = this;
    try {
      return await ctx.model[modelName].findAll({
        order: [
          [ 'id', 'DESC' ],
        ],
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
        raw: true,
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
  async _findAllBypage(modelName, pageSize, pageNum, title) {
    const {
      ctx,
    } = this;
    const where = {};
    if (title) {
      where.title = {
        [Op.like]: '%' + title + '%',
      };
    }
    try {
      return await ctx.model[modelName].findAndCountAll(
        {
          order: [
            [ 'id', 'DESC' ],
          ],
          attributes: { exclude: [ 'pwd' ] },
          where,
          limit: pageSize, // 每页多少条
          offset: pageSize * (pageNum - 1),
          raw: true,
        }
      );
    } catch (error) {
      return 'Server error';
    }
  }
}

module.exports = BaseService;
