'use strict';

const BaseController = require('../base');

class userController extends BaseController {
    //登录
    async login() {
        const {
            ctx,
            service,
            app
        } = this;
        const {
            username,
            password
        } = ctx.request.body;
        const pwd = await service.backEnd.user.findPwd(username);
        if (pwd[0]?.password && pwd[0].password == password) {
            // 用户存在,生成token
            const token = app.jwt.sign({
                username
            }, app.config.jwt.secret);
            this.success({
                id: pwd[0].id,
                token
            }, '登录成功');
        } else {
            this.error('用户名或密码错误');
        }

    }
    //修改用户信息
    async edit() {
        const {
            ctx,
            service
        } = this;
        let result = await service.backEnd.user.edit({
           ...ctx.request.body
        })
        if (result === 'Server error') this.error(0, result);
        this.success(1, result);
    }
}

module.exports = userController;