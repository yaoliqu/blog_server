
'use strict';

const BaseService = require('../base');

class describeList extends BaseService {
    //查询所有数据
    async findAll() {
        let data = await this._findAll('DescribeList')
        let total = await this._count('DescribeList')
        return { total, data }
    }
    //新增数据
    async add(json) {
        return await this._add('DescribeList', json)
    }

    //编辑数据
    async edit(json) {
        let data = await this._edit('DescribeList', json);
        if (!data) return "Id传入有误"
        return data
    }

    //删除数据
    async del(id) {
        let data = await this._delete('DescribeList', id);
        if (!data) return "Id传入有误"
        return data
    }
}

module.exports = describeList;


    // //根据ID查询数据
    // async findById(id) {
    //     return await this._findById('DescribeList', id)
    // }