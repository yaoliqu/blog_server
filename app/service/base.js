// app/service/base.js

'use strict';

const Service = require('egg').Service;

class BaseService extends Service {
    //查询数据
    async _findAll(modelName) {
        const {
            ctx,
            app
        } = this
        try {
            return await ctx.model[modelName].findAll()
        } catch (error) {
            return "Server error"
        }
    }

    //查询数据总数
    async _count(modelName) {
        const {
            ctx
        } = this
        try {
            return await ctx.model[modelName].count();
        } catch (error) {
            return "Server error"
        }
    }

    //根据ID查询数据
    async _findById(modelName, id) {
        const {
            ctx
        } = this
        try {
            const result = await ctx.model[modelName].findByPk(id);
            return result
        } catch (error) {
            return "Server error"
        }
    }

    //新增数据
    async _add(modelName, json) {
        const {
            ctx
        } = this
        try {
            await ctx.model[modelName].create(json)
            return "新增成功"
        } catch (error) {
            return "Server error"
        }
    }

    //编辑数据
    async _edit(modelName, json) {
        const {
            ctx
        } = this
        try {
            const result = await ctx.model[modelName].findByPk(json.id);
            if (!result) return false;
            await result.update({
                ...json
            });
            return "修改成功"
        } catch (error) {
            return "Server error"
        }
    }

    //删除数据
    async _delete(modelName, key) {
        const {
            ctx
        } = this;
        try {
            const result = await ctx.model[modelName].findByPk(key);
            if (!result) return false;
            await result.destroy();
            return '删除成功';
        } catch (error) {
            return "Server error"
        }
    }


    //根据条件查找一条数据
    async _findOne(modelName, obj = {}) {
        const {
            ctx
        } = this
        try {
            const result = await ctx.model[modelName].findOne({
                where: obj
            });
            return result
        } catch (error) {
            return "Server error"
        }
    }
    //条件查询
    async _findQueries(modelName,attributes=[], obj = {}) {
        const {
            ctx
        } = this
        try {
            const result = await ctx.model[modelName].findAll({
                attributes:attributes,
                where: obj,
                raw: true,
            });
            return result
        } catch (error) {
            return "Server error"
        }
    }
}

module.exports = BaseService;