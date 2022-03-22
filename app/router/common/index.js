'use strict';

module.exports = app => {
  const { router, controller } = app;
  router.get('/common', controller.common.index.test);
  router.get('/common/users/findAll', controller.common.test.findAll);
  router.get('/common/users/findById/:id', controller.common.test.findById);
  router.post('/common/users/add', controller.common.test.add);
  router.put('/common/users/edit', controller.common.test.edit);
  router.delete('/common/users/del/:id', controller.common.test.del)
};
