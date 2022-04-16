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
  // 关于
  router.get(`/${urlPrefix}/articleList/about`, controller.frontEnd.articleList.about);
  // say
  router.get(`/${urlPrefix}/articleList/say`, controller.frontEnd.articleList.say);
  // classList
  router.get(`/${urlPrefix}/articleList/classList`, controller.frontEnd.articleList.classList);
  // classListDetail
  router.get(`/${urlPrefix}/articleList/classListDetail`, controller.frontEnd.articleList.classListDetail);
};
