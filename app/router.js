'use strict';


/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  app.beforeStart(async () => {
    // 应用会等待这个函数执行完成才启动
    console.log('==app beforeStart==');
    await app.model.sync({
      // 为true时删除原表创建新表
      // 为false时不删除原有表，只创建不存在的
      force: false,
    });
  });
  require('./router/backEnd/index')(app);
  require('./router/frontEnd/index')(app);
};
