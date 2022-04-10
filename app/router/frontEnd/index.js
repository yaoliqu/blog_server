// 前台
'use strict';
const urlPrefix = 'front';
module.exports = app => {
  const {
    router,
    controller,
  } = app;
    // 描述列表
  router.get(`/${urlPrefix}/describeList/getOne`, controller.frontEnd.getDesc.getOne);
  // 文章列表
  router.get(`/${urlPrefix}/articleList/pages`, controller.frontEnd.articleList.getPagesList);
  // 文章，分类，标签总数
  router.get(`/${urlPrefix}/articleList/typeCount`, controller.frontEnd.articleList.typeCount);
  // 获取文章详情
  router.get(`/${urlPrefix}/articleList/getArticleById`, controller.frontEnd.articleList.getArticleById);
  // 私密文章验证
  router.post(`/${urlPrefix}/articleList/checkPwd`, controller.frontEnd.articleList.checkPwd);

};
