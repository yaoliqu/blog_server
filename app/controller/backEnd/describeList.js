'use strict';

const BaseController = require('../base');

class describeListController extends BaseController {
    //获取描述列表
    async getAll() {
        const {
            ctx,
            service
        } = this;
        let result = await service.backEnd.describeList.findAll()
        this.success(result, 'OK');
    }
    //新增数据
    async add() {
        const {
            ctx,
            service
        } = this;
        let {
            id,
            content
        } = ctx.request.body
        let result = await service.backEnd.describeList.add({
            id: 0,
            content
        })
        if (result === 'Server error') this.error(0, result);
        this.success(1, result);
    }

    //修改数据
    async edit() {
        const {
            ctx,
            service
        } = this;
        let {
            id,
            content
        } = ctx.request.body
        let result = await service.backEnd.describeList.edit({
            id,
            content
        })
        if (result === 'Server error') this.error(0, result);
        this.success(1, result);
    }

    //修改数据
    async del() {
        const {
            ctx,
            service
        } = this;
        let id = ctx.params.id
        let result = await service.backEnd.describeList.del(id)
        if (result === 'Server error') this.error(0, result);
        this.success(1, result);
    }
}

module.exports = describeListController;