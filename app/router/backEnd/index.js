// 后台
'use strict';
const urlPrefix = 'admin';
module.exports = app => {
  const {
    router,
    controller,
    jwt,
  } = app;
    // 描述列表
  router.get(`/${urlPrefix}/describeList/getAll`, jwt, controller.backEnd.describeList.getAll);
  router.post(`/${urlPrefix}/describeList/add`, jwt, controller.backEnd.describeList.add);
  router.put(`/${urlPrefix}/describeList/edit`, jwt, controller.backEnd.describeList.edit);
  router.delete(`/${urlPrefix}/describeList/del/:id`, jwt, controller.backEnd.describeList.del);
  //   router.get('/describeList/users/findAll', controller.describeList.test.findAll);
  //   router.get('/describeList/users/findById/:id', controller.describeList.test.findById);

  // 用户
  router.post(`/${urlPrefix}/user/login`, controller.backEnd.user.login);
  router.put(`/${urlPrefix}/user/edit`, jwt, controller.backEnd.user.edit);


  // 获取所有数据
  router.post(`/${urlPrefix}/getAll`, jwt, controller.backEnd.getAll.getAll);

};
