'use strict';

const Controller = require('egg').Controller;

class commonController extends Controller {
  async test() {
    const { ctx } = this;
    ctx.body = 'test';
  }
}

module.exports = commonController;
