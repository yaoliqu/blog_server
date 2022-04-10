
'use strict';

const BaseService = require('../base');

class describeList extends BaseService {
  // 查询所有数据
  async findAll() {
    const data = await this._findAll('DescribeList');
    const index = Math.floor((Math.random() * data.length));
    return data.length ? data[index].content : '';
  }
}

module.exports = describeList;

