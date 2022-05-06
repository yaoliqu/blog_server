'use strict';

const BaseService = require('../base');

class User extends BaseService {
  async findPwd(username) {
    return await this._findQueries('User', [ 'id', 'password' ], {
      username,
    });
  }
  async edit(json) {
    const data = await this._edit('User', {
      age: json.age,
      nickname: json.nickname,
      sex: json.sex,
      avatar: json.avatar,
      password: json.password,
      id: json.id,
    });
    if (!data) return 'Id传入有误';
    return data;
  }

}

module.exports = User;
