// app/controller/user.js
'use strict';

const BaseController = require('../base');

class TestController extends BaseController {
    //查询所有数据
    async findAll() {
        const { ctx, service } = this;
        let result = await service.common.test.findAll()
        this.success(result, 'OK');
    }

    //根据ID查数据
    async findById() {
        const { ctx, service } = this;
        let id = ctx.params.id
        let result = await service.common.test.findById(id)
        this.success(result, 'OK');
    }

    //新增数据
    async add() {
        const { ctx, service } = this;
        let { username, nickname, avatar, sex, age } = ctx.request.body
        let result = await service.common.test.add({ id: new Date().valueOf(), username, nickname, avatar, sex, age })
        if (result === 'Server error') this.error(0, result);
        this.success(1, result);
    }

    //修改数据
    async edit() {
        const { ctx, service } = this;
        let { id, username, nickname, avatar, sex, age } = ctx.request.body
        let result = await service.common.test.edit({ id, username, nickname, avatar, sex, age })
        if (result === 'Server error') this.error(0, result);
        this.success(1, result);
    }

    //修改数据
    async del() {
        const { ctx, service } = this;
        let id = ctx.params.id
        let result = await service.common.test.del(id)
        if (result === 'Server error') this.error(0, result);
        this.success(1, result);
    }
}

module.exports = TestController;
