
'use strict';

const BaseService = require('../base');
const Md5 = require('js-md5');
const salt = 'liku';
class articleList extends BaseService {
  // 查询所有数据
  async findAll(pageSize, pageNum, title, isClasses) {
    const result = await this._findAllBypage('Articlelist', pageSize, pageNum, title, isClasses);
    const content = '该文章暂无公开访问权限~';
    const list = result.rows.length ? result.rows.map(i => {
      if (!i.isshow) {
        return {
          ...i,
          content,
        };
      }
      return i;
    }) : [];
    const data = {
      list,
      total: result.count,
      pageSize,
      pageNum,
    };
    if (!Array.isArray(result.rows)) return '';
    return data;
  }
  // 文章，分类，标签总数
  async typeCountRiightSider() {
    const artCount = await this._count('Articlelist');
    const tagsCount = await this._count('Tags');
    const classCount = await this._count('Classlist');
    const tagsList = await this._findAll('Tags');
    const saySay = await this._findAll('Saysay');
    const data = {
      artCount,
      tagsCount,
      classCount,
      tagsList,
      saySay: Array.isArray(saySay) ? saySay.length ? saySay[0] : [] : saySay,
    };
    const isErr = Object.keys(data).some(key => data[key] === 'Server error');
    if (isErr) {
      return '';
    }
    return data;
  }
  // 获取文章详情
  async getArticleById(id, pwd) {
    if (!id) return { status: 0, data: '参数有误' };
    const result = await this._findById('Articlelist', id);
    if (result.isshow === 1) {
      Reflect.deleteProperty(result, 'pwd');
      return { status: 1, data: result };
    } else if (result.isshow === 0 && pwd) {
      if (Md5(result.pwd + salt) === pwd) {
        Reflect.deleteProperty(result, 'pwd');
        return { status: 1, data: result };
      }
      return { status: 0, data: '无权限' };
    }
    return { status: 0, data: '无权限' };
  }
  // 私密文章验证
  async checkPwd(id, pwd) {
    if (!id || !pwd) return { status: 0, data: '参数有误' };
    const result = await this._findById('Articlelist', id);
    if (Md5(result.pwd + salt) === pwd) {
      return { status: 1, data: result.pwd };
    }
    return { status: 0, data: '密码错误' };
  }

  // 关于
  async about() {
    const result = await this._findAll('About');
    if (!Array.isArray(result)) return '';
    return result;
  }
  // say
  async say() {
    const result = await this._findAll('Say', 'date');
    if (!Array.isArray(result)) return '';
    return result.filter(i => i.isshow);
  }
  // classList
  async classList() {
    const result = await this._findAll_group('Articlelist', 'classes');
    if (!Array.isArray(result)) return '';
    return result;
  }
}

module.exports = articleList;

