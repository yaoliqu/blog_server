'use strict';

const BaseController = require('../base');

class describeListController extends BaseController {
  // 获取描述
  async getOne() {
    const {
      service,
    } = this;
    const result = await service.frontEnd.describeList.findAll();
    if (result) {
      this.success(result, 'OK');
    } else {
      this.error('获取desc失败', 10001);
    }
  }
}

module.exports = describeListController;
