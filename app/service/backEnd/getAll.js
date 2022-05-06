'use strict';

const BaseService = require('../base');

class GetAll extends BaseService {
  // 查询所有数据
  async findAll(query) {
    if (!query) {
      return 'Server error';
    }
    const data = await this._findAll(query);
    return data;
  }

}

module.exports = GetAll;
