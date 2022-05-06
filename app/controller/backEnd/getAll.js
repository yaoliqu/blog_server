'use strict';

const BaseController = require('../base');

class getAllController extends BaseController {

  // 获取所有数据
  async getAll() {
    const {
      ctx,
      service,
    } = this;
    const result = await service.backEnd.getAll.findAll(ctx.request.body.query);
    if (Array.isArray(result)) {
      this.success(result, 'OK');
    } else {
      this.error('获取文章列表失败', 10001);
    }
  }
}

module.exports = getAllController;
