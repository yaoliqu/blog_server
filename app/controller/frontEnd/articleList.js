'use strict';

const BaseController = require('../base');

class articleListController extends BaseController {
  // 获取文章列表
  async getPagesList() {
    const {
      service,
      ctx,
    } = this;
    const pageSize = parseInt(ctx.query.pageSize) || 10;
    const pageNum = parseInt(ctx.query.pageNum) || 1;
    const title = ctx.query.title;
    const result = await service.frontEnd.articleList.findAll(pageSize, pageNum, title);
    if (result) {
      this.success(result, 'OK');
    } else {
      this.error('获取文章列表失败', 10001);
    }
  }
  // 文章，分类，标签总数
  async typeCount() {
    const {
      service,
    } = this;
    const result = await service.frontEnd.articleList.typeCountRiightSider();
    if (result) {
      this.success(result, 'OK');
    } else {
      this.error('获取主页右侧数据失败', 10001);
    }
  }
  // 获取文章详情
  async getArticleById() {
    const {
      service,
      ctx,
    } = this;
    const id = ctx.query.id;
    const pwd = ctx.query.pwd;
    const result = await service.frontEnd.articleList.getArticleById(id, pwd);
    if (result.status) {
      this.success(result.data, 'OK');
    } else {
      this.error(result.data, 10002);
    }
  }
  // 私密文章验证
  async checkPwd() {
    const {
      service,
      ctx,
    } = this;
    const {
      id,
      pwd,
    } = ctx.request.body;
    const result = await service.frontEnd.articleList.checkPwd(id, pwd);
    if (result.status) {
      this.success(result.data, 'OK');
    } else {
      this.error(result.data, 10002);
    }
  }

  // 关于
  async about() {
    const {
      service,
    } = this;
    const result = await service.frontEnd.articleList.about();
    if (result) {
      this.success(result, 'OK');
    } else {
      this.error('获取关于数据失败', 10001);
    }
  }
  // say
  async say() {
    const {
      service,
    } = this;
    const result = await service.frontEnd.articleList.say();
    if (result) {
      this.success(result, 'OK');
    } else {
      this.error('获取say数据失败', 10001);
    }
  }
  // classList
  async classList() {
    const {
      service,
    } = this;
    const result = await service.frontEnd.articleList.classList();
    if (result) {
      this.success(result, 'OK');
    } else {
      this.error('获取classList数据失败', 10001);
    }
  }
  // classListDetail
  async classListDetail() {
    const {
      service,
      ctx,
    } = this;
    const pageSize = parseInt(ctx.query.pageSize) || 10;
    const pageNum = parseInt(ctx.query.pageNum) || 1;
    const classes = ctx.query.classes;
    const result = await service.frontEnd.articleList.findAll(pageSize, pageNum, classes, true);
    if (result) {
      this.success(result, 'OK');
    } else {
      this.error('获取文章列表失败', 10001);
    }
  }
}

module.exports = articleListController;
