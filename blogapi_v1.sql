/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : blogapi

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 17/04/2022 12:39:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for about
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about` (
  `id` int NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isMe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of about
-- ----------------------------
BEGIN;
INSERT INTO `about` VALUES (1, '### 👋 你好啊，我叫飞鸟！\\n\\n-   👀 一名**在校学生**\\n-   💻 热爱**前端开发**\\n-   👨‍🏭希望成为一名**优秀前端工程师**\\n\\n这是我自己写的**个人博客**，感谢你在茫茫互联网中找到了这里～\\n\\n请多多指教！😝😝😝\\n\\n\\n\\n📖**联系方式**\\n\\n- 🐧QQ：`965555169`\\n- ✉️邮箱：`lzxjack1998@163.com`\\n- 💻GitHub：https://github.com/lzxjack ', 'true');
INSERT INTO `about` VALUES (2, '### 🖥️关于本站\\n\\n本站是自己学习了**React**后，用**React**写的个人博客系统，包括**博客展示页面**和**后台管理页面**，现在看到的就是**博客展示页面** \\n\\n主要整理、分享一些自己的学习笔记和心得，若有错误，欢迎大家指出、交流！\\n\\n✅目前**博客展示页面**已成功升级`2.0`版本，样式基本保持原样，主要是逻辑代码进行了重构，优化了整体的性能😎。\\n\\n❓**后台管理页面**也有重构计划，但接下来一段时间要忙起来了，**短期内**不会有大改动。\\n\\n\\n\\n🔖博客主要使用到的库如下：\\n\\n**前端**（博客展示页面）：\\n\\n- 主要技术栈为`react`+`hooks`+`TS`\\n- 使用自建`webpack`脚手架<a href=\"https://github.com/lzxjack/my-react\" target=\"_blank\">my-react</a>开发\\n- `react`相关库`React-Router`、`Redux`等\\n- `AntD`组件库（自定义样式/按需导入）\\n- `ahooks`库提供常用的`hooks`\\n- `axios`网络请求库\\n- `echarts`图标库绘制饼图\\n- 时间格式化工具`dayjs`\\n- `markdown`格式渲染工具`marked`\\n- 代码高亮渲染工具`highlight.js`\\n- 其他常用工具库等\\n\\n**后端**：\\n\\n后端使用腾讯云`CloudBase`云端一体化后端云服务，包括：\\n\\n- 用户管理：管理员登录、未登录访问\\n- 数据库：存放管理员的博客数据\\n- 网站托管：托管博客静态网页\\n- 云函数：部署邮箱提醒`API`，有新评论/回复时触发，发送邮件提醒\\n\\n**其他**：\\n\\n- `eslint`规范代码风格\\n- `commitlint`保证`git commit`提交规范\\n\\n\\n\\n\\n### ✔️本站链接\\n\\n如果想和博主**交换友链**，可以在<a href=\"https://lzxjack.top/msg\" target=\"_self\">「留言板」</a>留言，欢迎各路大佬交流~\\n\\n我的链接：\\n\\n ```\\n name: 飞鸟\\nlink: https://lzxjack.top/\\navatar: https://cdn.jsdelivr.net/gh/lzxjack/cdn/img/202203302154224.webp\\ndescr: 一只平凡的鸟罢了。\\n``` \\n\\n\\n', 'false');
COMMIT;

-- ----------------------------
-- Table structure for art_tags_min
-- ----------------------------
DROP TABLE IF EXISTS `art_tags_min`;
CREATE TABLE `art_tags_min` (
  `tagid` int NOT NULL,
  `artid` int NOT NULL,
  PRIMARY KEY (`tagid`,`artid`),
  UNIQUE KEY `art_tags_min_tagid_artid_unique` (`tagid`,`artid`),
  KEY `artid` (`artid`),
  CONSTRAINT `art_tags_min_ibfk_1` FOREIGN KEY (`tagid`) REFERENCES `tagslist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `art_tags_min_ibfk_2` FOREIGN KEY (`artid`) REFERENCES `articlelist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of art_tags_min
-- ----------------------------
BEGIN;
INSERT INTO `art_tags_min` VALUES (1, 1);
INSERT INTO `art_tags_min` VALUES (2, 1);
INSERT INTO `art_tags_min` VALUES (3, 1);
INSERT INTO `art_tags_min` VALUES (4, 1);
INSERT INTO `art_tags_min` VALUES (1, 2);
INSERT INTO `art_tags_min` VALUES (1, 3);
INSERT INTO `art_tags_min` VALUES (1, 4);
COMMIT;

-- ----------------------------
-- Table structure for articlelist
-- ----------------------------
DROP TABLE IF EXISTS `articlelist`;
CREATE TABLE `articlelist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `classes` varchar(255) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `isShow` int NOT NULL DEFAULT '1',
  `updateTime` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of articlelist
-- ----------------------------
BEGIN;
INSERT INTO `articlelist` VALUES (1, 'aa', 'utf8mb4', '1649341088000', 'jjj', 'jjjjj', 0, '', '1234');
INSERT INTO `articlelist` VALUES (2, 'bb', '最近学习了状态管理库 redux 的源码，简单记录一下学习笔记。\n\n## Flux 思想\n\n学习 redux 就不得不涉及 Flux 架构。 \n\nFlux 将一个应用分成四个部分：\n\n- View：视图层\n- Action：动作\n- Dispatcher：派发`action`\n- Store：数据层\n\n如图为 Flux 模型图，最大的特点是数据的单向流动，相邻的两部分不会有双向箭头。\n\n![20210525222559165](https://cdn.jsdelivr.net/gh/lzxjack/cdn/img/202204092204826.png)\n\n流程如下：\n\n- 初始化阶段\n\n  初始化`Action`，`Dispatcher`根据`Action`，要求`Store`作相应的数据初始化，展示在`View`。\n\n- 更新阶段\n\n  用户访问`View`，`View`发出`Action`，`Dispatcher`根据`Action`，要求`Store`作相应的数据更新。`View`收到`Store`的通知后，更新页面。\n\n## redux 简介\n\n`redux`是 JavaScript 的状态管理库，提供可预测的状态管理。\n\n`redux`有几个核心概念：\n\n- `store`：唯一存放状态的容器\n- `state`：状态\n- `action`：状态更新的动作\n- `reducer`：`action`对应的更新状态的动作函数\n- `dispatch`：通过`action`找到对应的`reducer`，更新`state`\n\n`redux`的使用有三大原则：\n\n- 单一数据源\n\n  整个应用的`state`存储在一个状态树中，整个状态树只存在于唯一的`store`里。\n\n- `state`只读\n\n  状态是只读的，不要直接修改`state`。唯一改变`state`的方法就是调用`dispatch`触发`action`。直接修改`state`的话，并不会通知所有订阅者。\n\n- 纯函数执行修改\n\n  `reducer`是纯函数，传入先前的`state`和`action`，返回新的`state`。\n\n## redux 简单使用\n\n如下代码所示，用`redux`简单写了个计数的 demo，仅用到了`createStore`这个方法。\n\n```javascript\nimport { createStore } from \'redux\';\n\n// 初始状态\nconst initialState = 0;\n// 创建reducer\nconst reducer = (preState = initialState, action) => {\n  const { type } = action;\n  switch (type) {\n    case \'ADD\':\n      return preState + 1;\n    case \'SUB\':\n      return preState - 1;\n    default:\n      return preState;\n  }\n};\n\n// 创建store\nconst store = createStore(reducer);\n\n// 订阅，当state改变，打印state\nstore.subscribe(() => console.log(store.getState()));\n\n// 生成action的函数\nconst add = () => ({ type: \'ADD\' });\nconst sub = () => ({ type: \'SUB\' });\n\nstore.dispatch(add()); // 1\nstore.dispatch(add()); // 2\nstore.dispatch(add()); // 3\nstore.dispatch(add()); // 4\n\nstore.dispatch(sub()); // 3\nstore.dispatch(sub()); // 2\n```\n\n通过这个 demo，可以大致了解`redux`的工作流程：\n\n1. 首先要创建`reducer`函数，它是一个纯函数，接收之前的状态`preState`和`action`，根据`action`作一些处理之后，返回新的`state`。\n2. 使用`createStore`方法创建`store`，接收创建好的`reducer`。其实还可以传入其他参数，后面阅读源码会看到。\n3. `store.subscribe`订阅消息，参数是函数。只有订阅了，在`dispatch`时，才会通知每个监听者。\n4. 定义好不同的`action`，这里定义了两个生成`action`的函数，需要用时，调用这个函数即可。\n5. 最后就是调用`store.dispatch`，根据`action`更新`state`，通知监听者。\n\n## redux 源码笔记\n\n整个`redux`源码的结构如下。\n\n![image-20220406202758343](https://cdn.jsdelivr.net/gh/lzxjack/cdn/img/202204062028423.png)\n\n`utils`文件夹主要是一些轻量工具函数，比较简单。`index.js`是入口文件，暴露了供开发者使用的方法。其他文件则是相应方法的实现。\n\n下面根据不同文件，整理了自己对其的理解和笔记。\n\n### utils\n\n（1）`actionTypes.js`\n\n这些是`redux`的私有`action`，在代码中不要直接引用这些`action`。\n\n```javascript\n// 随机生成长度为6的字符串，并用.连接\nconst randomString = () => Math.random().toString(36).substring(7).split(\'\').join(\'.\');\n\nconst ActionTypes = {\n  INIT: `@@redux/INIT${randomString()}`,\n  REPLACE: `@@redux/REPLACE${randomString()}`,\n  PROBE_UNKNOWN_ACTION: () => `@@redux/PROBE_UNKNOWN_ACTION${randomString()}`\n};\n\nexport default ActionTypes;\n```\n\n`randomString`使用了`Number.prototype.toString()`，覆盖了`Object`上的`toString()`方法。转换基数为`36`，10 个数字和 26 个字母，表示随机生成随机字符串，包含数字和字母。截取 6 位，用`.`连接。\n\n最后向外暴露了 3 个`action`：`INIT`、`REPLACE`、`PROBE_UNKNOWN_ACTION`。\n\n（2）`formatProdErrorMessage.js`\n\n此文件用来格式化**生产**环境的`error`。不要直接引用此模块。\n\n```javascript\nfunction formatProdErrorMessage(code) {\n  return (\n    `Minified Redux error #${code}; visit https://redux.js.org/Errors?code=${code} for the full message or ` +\n    \'use the non-minified dev environment for full errors. \'\n  );\n}\n\nexport default formatProdErrorMessage;\n```\n\n（3）`isPlainObject.js`\n\n该方法用来判断一个对象是否是简单对象。\n\n简单对象满足`obj.__proto__ === Object.prototype`。`new Object`和**字面量**创建出的对象，是简单对象。\n\n换句话说，此方法判断的是一个对象是否是`Object`的实例对象。\n\n```javascript\nexport default function isPlainObject(obj) {\n  // 因为typeof null显示为\'object\'，所以单独讨论\n  if (typeof obj !== \'object\' || obj === null) return false;\n\n  let proto = obj;\n  // 沿着__proto__向上遍历原型链\n  while (Object.getPrototypeOf(proto) !== null) {\n    proto = Object.getPrototypeOf(proto);\n  }\n\n  // 最后判断原始对象的__proto__是否等于原型链的最上端\n  return Object.getPrototypeOf(obj) === proto;\n}\n```\n\n（4）`kindOf.js`\n\n该方法是一个判断数据类型的函数，比较简单。值得学习之处是，`typeof`、`constructor`、`instanceof`都可以在一定条件下判断数据类型。\n\n```javascript\nfunction miniKindOf(val) {\n  if (val === void 0) return \'undefined\';\n  if (val === null) return \'null\';\n\n  // 以下数据类型不用处理\n  const type = typeof val;\n  switch (type) {\n    case \'boolean\':\n    case \'string\':\n    case \'number\':\n    case \'symbol\':\n    case \'function\': {\n      return type;\n    }\n    default:\n      break;\n  }\n\n  // 单独判断数组、日期、错误对象\n  if (Array.isArray(val)) return \'array\';\n  if (isDate(val)) return \'date\';\n  if (isError(val)) return \'error\';\n\n  // 通过val.constructor.name判断以下类型\n  const constructorName = ctorName(val);\n  switch (constructorName) {\n    case \'Symbol\':\n    case \'Promise\':\n    case \'WeakMap\':\n    case \'WeakSet\':\n    case \'Map\':\n    case \'Set\':\n      return constructorName;\n    default:\n      break;\n  }\n\n  // other\n  return type.slice(8, -1).toLowerCase().replace(/\\s/g, \'\');\n}\n\nfunction ctorName(val) {\n  return typeof val.constructor === \'function\' ? val.constructor.name : null;\n}\n\nfunction isError(val) {\n  return (\n    val instanceof Error ||\n    (typeof val.message === \'string\' &&\n      val.constructor &&\n      typeof val.constructor.stackTraceLimit === \'number\')\n  );\n}\n\nfunction isDate(val) {\n  if (val instanceof Date) return true;\n  return (\n    typeof val.toDateString === \'function\' &&\n    typeof val.getDate === \'function\' &&\n    typeof val.setDate === \'function\'\n  );\n}\n\nexport function kindOf(val) {\n  let typeOfVal = typeof val;\n\n  // 开发环境下，进一步处理\n  if (process.env.NODE_ENV !== \'production\') {\n    typeOfVal = miniKindOf(val);\n  }\n\n  return typeOfVal;\n}\n```\n\n（5）`warning.js`\n\n判断了下`console`是否存在，打印错误信息。\n\n```javascript\nexport default function warning(message) {\n  // 检测console是否存在\n  if (typeof console !== \'undefined\' && typeof console.error === \'function\') {\n    console.error(message);\n  }\n  try {\n    throw new Error(message);\n  } catch (e) {}\n}\n```\n\n### index.js\n\n该文件是`redux`的入口文件，向开发者暴露了几个方法。\n\n- `createStore`：创建`store`\n- `combineReducers`：将多个`reducer`合并成单个`reducer`\n- `bindActionCreators`：将`action`与对应的`dispatch`方法绑定，生成可以直接执行`action`的函数\n- `applyMiddleware`：增强`redux`功能\n- `compose`：组合函数，连接多个函数\n\n```javascript\nfunction isCrushed() {}\n\n// 若开发环境压缩了代码，提示warning\nif (\n  process.env.NODE_ENV !== \'production\' &&\n  typeof isCrushed.name === \'string\' &&\n  isCrushed.name !== \'isCrushed\'\n) {\n  warning(\n    \'You are currently using minified code outside of NODE_ENV === \"production\". \' +\n      \'This means that you are running a slower development build of Redux. \' +\n      \'You can use loose-envify (https://github.com/zertosh/loose-envify) for browserify \' +\n      \'or setting mode to production in webpack (https://webpack.js.org/concepts/mode/) \' +\n      \'to ensure you have the correct code for your production build.\'\n  );\n}\n\nexport {\n  createStore,\n  combineReducers,\n  bindActionCreators,\n  applyMiddleware,\n  compose,\n  // 不要使用自带的action\n  __DO_NOT_USE__ActionTypes\n};\n```\n\n这里定义了一个`isCrushed`的空函数，目的是判断用户是否压缩了代码，因为如果压缩了代码，函数`isCrushed`的函数名就会被替换，不再是`isCrushed`了。若在**开发环境**下压缩了代码，给出`warning`提示。\n\n### createStore.js\n\n此方法是`redux`源码阅读的重点，也是使用`redux`的第一个步骤。\n\n该方法接收三个参数：`reducer`、`preloadedState`、`enhancer`。`reducer`是产生新`state`的函数，`preloadedState`代表初始状态，`enhancer`是增强`redux`用的函数。\n\n向外暴露了一些方法，其中`dispatch`、`subscribe`、`getState`是开发中常用的方法。\n\n```javascript\nexport default function createStore(reducer, preloadedState, enhancer) {\n  // 判断是否传入多个enhancer，确保只传入一个enhancer\n  // 若要使用多个enhancer，可以将其合并为一个函数\n  if (\n    (typeof preloadedState === \'function\' && typeof enhancer === \'function\') ||\n    (typeof enhancer === \'function\' && typeof arguments[3] === \'function\')\n  ) {\n    throw new Error(\n      \'It looks like you are passing several store enhancers to \' +\n        \'createStore(). This is not supported. Instead, compose them \' +\n        \'together to a single function. See https://redux.js.org/tutorials/fundamentals/part-4-store#creating-a-store-with-enhancers for an example.\'\n    );\n  }\n\n  // 若第二个参数是函数，且没有传入第三个参数\n  // 则第二个参数作为enhancer，preloadedState不传入\n  if (typeof preloadedState === \'function\' && typeof enhancer === \'undefined\') {\n    enhancer = preloadedState;\n    preloadedState = undefined;\n  }\n\n  // 首先若传入了enhancer，则返回增强后的createStore执行的结果\n  if (typeof enhancer !== \'undefined\') {\n    // 确保enhancer是函数\n    if (typeof enhancer !== \'function\') {\n      throw new Error(\n        `Expected the enhancer to be a function. Instead, received: \'${kindOf(enhancer)}\'`\n      );\n    }\n\n    // 返回增强后的createStore执行的结果\n    return enhancer(createStore)(reducer, preloadedState);\n  }\n\n  // 确保reducer是函数，若不是函数，显示其类型\n  if (typeof reducer !== \'function\') {\n    throw new Error(\n      `Expected the root reducer to be a function. Instead, received: \'${kindOf(\n        reducer\n      )}\'`\n    );\n  }\n\n  // 当前的reducer\n  let currentReducer = reducer;\n  // 当前的state\n  let currentState = preloadedState;\n  // 当前订阅者列表\n  let currentListeners = [];\n  let nextListeners = currentListeners;\n  // 锁，保证数据一致性\n  let isDispatching = false;\n\n  // 当nextListeners和currentListeners是同一个引用时，\n  // 将currentListeners的拷贝赋值给nextListeners\n  // 防止当前队列执行的时候，影响到自身\n  function ensureCanMutateNextListeners() {\n    if (nextListeners === currentListeners) {\n      nextListeners = currentListeners.slice();\n    }\n  }\n\n  // 直接返回当前的state\n  // 从这里可以得到若直接修改currentState，并不会通知订阅者\n  function getState() {\n    // 确保没有其他reducer操作\n    if (isDispatching) {\n      throw new Error(\n        \'You may not call store.getState() while the reducer is executing. \' +\n          \'The reducer has already received the state as an argument. \' +\n          \'Pass it down from the top reducer instead of reading it from the store.\'\n      );\n    }\n\n    return currentState;\n  }\n\n  // 添加订阅者\n  // 返回取消订阅的函数\n  function subscribe(listener) {\n    // 确保listener是个函数\n    if (typeof listener !== \'function\') {\n      throw new Error(\n        `Expected the listener to be a function. Instead, received: \'${kindOf(listener)}\'`\n      );\n    }\n\n    // 确保数据唯一性\n    if (isDispatching) {\n      throw new Error(\n        \'You may not call store.subscribe() while the reducer is executing. \' +\n          \'If you would like to be notified after the store has been updated, subscribe from a \' +\n          \'component and invoke store.getState() in the callback to access the latest state. \' +\n          \'See https://redux.js.org/api/store#subscribelistener for more details.\'\n      );\n    }\n\n    // 该订阅者在订阅状态\n    let isSubscribed = true;\n\n    // 若nextListeners和currentListeners为同一个引用\n    // 将currentListeners作一次浅拷贝，给nextListeners\n    ensureCanMutateNextListeners();\n    // 新的订阅者加入订阅者列表中\n    nextListeners.push(listener);\n\n    // 返回取消订阅的函数\n    return function unsubscribe() {\n      // 若已经取消订阅，不继续执行\n      if (!isSubscribed) {\n        return;\n      }\n\n      // 保证数据唯一性\n      if (isDispatching) {\n        throw new Error(\n          \'You may not unsubscribe from a store listener while the reducer is executing. \' +\n            \'See https://redux.js.org/api/store#subscribelistener for more details.\'\n        );\n      }\n\n      // 取消订阅\n      isSubscribed = false;\n\n      ensureCanMutateNextListeners();\n      // 将该订阅者从订阅者列表中删除\n      const index = nextListeners.indexOf(listener);\n      nextListeners.splice(index, 1);\n      currentListeners = null;\n    };\n  }\n\n  // 分派action，这是触发state更新的唯一方法\n  // action仅支持简单对象，若action是Promise、Observable等，需要使用中间件\n  // action表明了做了什么改变，必须有type属性，并且非undefined，一个好的实践为type是字符串常量\n  // 返回dispatch的action，若使用了中间件，可能返回其他\n  function dispatch(action) {\n    // 确保action是简单对象\n    if (!isPlainObject(action)) {\n      throw new Error(\n        `Actions must be plain objects. Instead, the actual type was: \'${kindOf(\n          action\n        )}\'. You may need to add middleware to your store setup to handle dispatching other values, such as \'redux-thunk\' to handle dispatching functions. See https://redux.js.org/tutorials/fundamentals/part-4-store#middleware and https://redux.js.org/tutorials/fundamentals/part-6-async-logic#using-the-redux-thunk-middleware for examples.`\n      );\n    }\n\n    // 确保action.type存在\n    if (typeof action.type === \'undefined\') {\n      throw new Error(\n        \'Actions may not have an undefined \"type\" property. You may have misspelled an action type string constant.\'\n      );\n    }\n\n    // 确保当前没有在执行其他的reducer操作\n    if (isDispatching) {\n      throw new Error(\'Reducers may not dispatch actions.\');\n    }\n\n    try {\n      // 加锁，防止后续的reducer操作\n      isDispatching = true;\n      // 调用当前的reducer，返回新的state，赋值给currentState\n      currentState = currentReducer(currentState, action);\n    } finally {\n      // 无论是否有错误，都会执行的语句\n      // 当前reducer执行完毕后，解锁\n      isDispatching = false;\n    }\n\n    // 通知订阅者\n    // currentListeners = nextListeners是为了下一次执行的时候，会重新生成一个新的拷贝\n    const listeners = (currentListeners = nextListeners);\n    for (let i = 0; i < listeners.length; i++) {\n      // 执行订阅者的函数，不传入参数\n      const listener = listeners[i];\n      // 执行函数\n      listener();\n    }\n\n    // 最后返回当前的action\n    return action;\n  }\n\n  // 替换reducer\n  // 使用场景：\n  // 1. 代码分割，立即加载reducers的时候\n  // 2. 实现redux热加载机制的时候\n  function replaceReducer(nextReducer) {\n    // 确保nextReducer是函数\n    if (typeof nextReducer !== \'function\') {\n      throw new Error(\n        `Expected the nextReducer to be a function. Instead, received: \'${kindOf(\n          nextReducer\n        )}`\n      );\n    }\n\n    // 替换reducer\n    currentReducer = nextReducer;\n\n    // 触发state更新\n    dispatch({ type: ActionTypes.REPLACE });\n  }\n\n  // 一般用不到\n  function observable() {\n    // ...\n  }\n\n  // 初始化state，否则第一次的currentState为undefined\n  dispatch({ type: ActionTypes.INIT });\n\n  return {\n    dispatch,\n    subscribe,\n    getState,\n    replaceReducer,\n    [$$observable]: observable\n  };\n}\n```\n\n### combineReducers.js\n\n该方法的作用是合并多个`reducers`为单个`reducer`。输入参数是一个拥有多个`reducer`的对象，最后返回一个函数，处理所有的`reducer`。\n\n```javascript\nfunction getUnexpectedStateShapeWarningMessage(\n  inputState,\n  reducers,\n  action,\n  unexpectedKeyCache\n) {\n  const reducerKeys = Object.keys(reducers);\n  const argumentName =\n    action && action.type === ActionTypes.INIT\n      ? \'preloadedState argument passed to createStore\'\n      : \'previous state received by the reducer\';\n\n  if (reducerKeys.length === 0) {\n    return (\n      \'Store does not have a valid reducer. Make sure the argument passed \' +\n      \'to combineReducers is an object whose values are reducers.\'\n    );\n  }\n\n  if (!isPlainObject(inputState)) {\n    return (\n      `The ${argumentName} has unexpected type of \"${kindOf(\n        inputState\n      )}\". Expected argument to be an object with the following ` +\n      `keys: \"${reducerKeys.join(\'\", \"\')}\"`\n    );\n  }\n\n  // 找出inputState里有的key，但reducers集合里没有的key\n  const unexpectedKeys = Object.keys(inputState).filter(\n    key => !reducers.hasOwnProperty(key) && !unexpectedKeyCache[key]\n  );\n\n  unexpectedKeys.forEach(key => {\n    unexpectedKeyCache[key] = true;\n  });\n\n  // 如果是替换reducer的action，则提前退出，不打印异常\n  if (action && action.type === ActionTypes.REPLACE) return;\n\n  if (unexpectedKeys.length > 0) {\n    return (\n      `Unexpected ${unexpectedKeys.length > 1 ? \'keys\' : \'key\'} ` +\n      `\"${unexpectedKeys.join(\'\", \"\')}\" found in ${argumentName}. ` +\n      `Expected to find one of the known reducer keys instead: ` +\n      `\"${reducerKeys.join(\'\", \"\')}\". Unexpected keys will be ignored.`\n    );\n  }\n}\n\n// 用于规范reducers\nfunction assertReducerShape(reducers) {\n  Object.keys(reducers).forEach(key => {\n    const reducer = reducers[key];\n    const initialState = reducer(undefined, { type: ActionTypes.INIT });\n\n    // 确保初始值不为undefined\n    if (typeof initialState === \'undefined\') {\n      throw new Error(\n        `The slice reducer for key \"${key}\" returned undefined during initialization. ` +\n          `If the state passed to the reducer is undefined, you must ` +\n          `explicitly return the initial state. The initial state may ` +\n          `not be undefined. If you don\'t want to set a value for this reducer, ` +\n          `you can use null instead of undefined.`\n      );\n    }\n\n    // 确保遇到未知的action，返回初始值，并且不为undefined\n    // 确保没有占用redux的命名空间\n    if (\n      typeof reducer(undefined, {\n        type: ActionTypes.PROBE_UNKNOWN_ACTION()\n      }) === \'undefined\'\n    ) {\n      throw new Error(\n        `The slice reducer for key \"${key}\" returned undefined when probed with a random type. ` +\n          `Don\'t try to handle \'${ActionTypes.INIT}\' or other actions in \"redux/*\" ` +\n          `namespace. They are considered private. Instead, you must return the ` +\n          `current state for any unknown actions, unless it is undefined, ` +\n          `in which case you must return the initial state, regardless of the ` +\n          `action type. The initial state may not be undefined, but can be null.`\n      );\n    }\n  });\n}\n\n// 合并多个reducer为单个reducer\n// 输入参数reducers是一个对象，值是需要合并的reducer\n// 会调用所有的子reducer，聚合所有结果合并为一个object\n// 返回合并后的单个reducer\nexport default function combineReducers(reducers) {\n  // reducers对象的key数组\n  const reducerKeys = Object.keys(reducers);\n  // 最终要返回的reducer\n  const finalReducers = {};\n\n  // 遍历key数组，浅拷贝reducers\n  for (let i = 0; i < reducerKeys.length; i++) {\n    const key = reducerKeys[i];\n\n    // 若开发环境，且当前reducer函数名不再存在，给出warning\n    if (process.env.NODE_ENV !== \'production\') {\n      if (typeof reducers[key] === \'undefined\') {\n        warning(`No reducer provided for key \"${key}\"`);\n      }\n    }\n\n    // 当前reducer是函数，添加到finalReducers中\n    if (typeof reducers[key] === \'function\') {\n      finalReducers[key] = reducers[key];\n    }\n  }\n  // 获取finalReducers的所有key\n  const finalReducerKeys = Object.keys(finalReducers);\n\n  // 确保不警告多次相同的key\n  let unexpectedKeyCache;\n  if (process.env.NODE_ENV !== \'production\') {\n    // 开发环境为{}\n    unexpectedKeyCache = {};\n  }\n\n  let shapeAssertionError;\n  try {\n    // 确保所有reducers遇到未知的action，返回初始值，且不为undefined\n    // 确保没有占用redux命名空间\n    assertReducerShape(finalReducers);\n  } catch (e) {\n    shapeAssertionError = e;\n  }\n\n  // 返回最后的reducer\n  return function combination(state = {}, action) {\n    // 错误信息\n    if (shapeAssertionError) {\n      throw shapeAssertionError;\n    }\n\n    // 生产环境，找出state里面没有对应reducer的key，给出提示\n    if (process.env.NODE_ENV !== \'production\') {\n      const warningMessage = getUnexpectedStateShapeWarningMessage(\n        state,\n        finalReducers,\n        action,\n        unexpectedKeyCache\n      );\n      if (warningMessage) {\n        warning(warningMessage);\n      }\n    }\n\n    // 表示state是否已被更改\n    let hasChanged = false;\n    // 改变后的state\n    const nextState = {};\n    for (let i = 0; i < finalReducerKeys.length; i++) {\n      const key = finalReducerKeys[i];\n      const reducer = finalReducers[key];\n      // 当前key的state值\n      const previousStateForKey = state[key];\n      // 执行当前reducer，拿到state\n      const nextStateForKey = reducer(previousStateForKey, action);\n      // 对新的state做undefined检验\n      if (typeof nextStateForKey === \'undefined\') {\n        const actionType = action && action.type;\n        throw new Error(\n          `When called with an action of type ${\n            actionType ? `\"${String(actionType)}\"` : \'(unknown type)\'\n          }, the slice reducer for key \"${key}\" returned undefined. ` +\n            `To ignore an action, you must explicitly return the previous state. ` +\n            `If you want this reducer to hold no value, you can return null instead of undefined.`\n        );\n      }\n      // 新的state放在相应nextState中\n      nextState[key] = nextStateForKey;\n      // 判断新旧state是不是同一个引用，若state发生变化，则肯定已经改变\n      hasChanged = hasChanged || nextStateForKey !== previousStateForKey;\n    }\n    hasChanged = hasChanged || finalReducerKeys.length !== Object.keys(state).length;\n    // 发生变化则返回nextState，否则返回state\n    return hasChanged ? nextState : state;\n  };\n}\n```\n\n### bindActionCreators.js\n\n该方法的作用是将`action`与对应的`dispatch`方法绑定，生成可以直接执行`action`的函数。\n\n输入参数`actionCreators`可以是创建`action`的函数对象，也可以是单个创建`action`的函数。`dispatch`即为`store`提供的`dispatch`函数。\n\n返回一个与原对象类似的对象，只不过这个对象的`value`都是会直接`dispatch`原`action creator`产生的`action`。如果传入一个单独的函数作为`actionCreators`，那么返回的结果也是一个单独的函数。\n\n```javascript\n// actionCreator是产生action的函数，执行之后，会得到一个action\n// 得到的action再传递给dispatch\n// bindActionCreator函数返回一个自动执行dispatch的方法\nfunction bindActionCreator(actionCreator, dispatch) {\n  // 闭包\n  return function () {\n    // 返回结果为dispatch这个actionCreator并传参\n    return dispatch(actionCreator.apply(this, arguments));\n  };\n}\n\n//  actionCreators：创造action的函数对象\nexport default function bindActionCreators(actionCreators, dispatch) {\n  // 如果是一个函数，直接执行bindActionCreator并返回\n  if (typeof actionCreators === \'function\') {\n    return bindActionCreator(actionCreators, dispatch);\n  }\n\n  // 错误处理\n  if (typeof actionCreators !== \'object\' || actionCreators === null) {\n    throw new Error(\n      `bindActionCreators expected an object or a function, but instead received: \'${kindOf(\n        actionCreators\n      )}\'. ` +\n        `Did you write \"import ActionCreators from\" instead of \"import * as ActionCreators from\"?`\n    );\n  }\n\n  const boundActionCreators = {};\n  // 遍历每个函数\n  for (const key in actionCreators) {\n    // 拿到每个函数\n    const actionCreator = actionCreators[key];\n    if (typeof actionCreator === \'function\') {\n      // 将自动执行dispatch的方法放到boundActionCreators中\n      boundActionCreators[key] = bindActionCreator(actionCreator, dispatch);\n    }\n  }\n  return boundActionCreators;\n}\n```\n\n### compose.js\n\n该方法将多个函数连接起来，上一个函数的返回值作为下一个函数的参数输入。\n\n注意，它的执行顺序为**从右到左**。\n\n```javascript\n// 将多个函数连接起来：上一个函数的返回值作为下一个参数的输入\n// 最终得到最后的返回值\n// 从右向左的顺序执行\nexport default function compose(...funcs) {\n  if (funcs.length === 0) {\n    return arg => arg;\n  }\n\n  if (funcs.length === 1) {\n    return funcs[0];\n  }\n\n  // 利用reduce方法执行每个中间件函数，并将上一个函数的返回作为下一个函数的参数\n  // a:上一次调用回调的返回值，b:当前处理的元素\n  // 所以是从右向左的顺序执行\n  // compose(f, g, h)\n  // (...args) => f(g(h(...args)))\n  return funcs.reduce(\n    (a, b) =>\n      (...args) =>\n        a(b(...args))\n  );\n}\n```\n\n### applyMiddleware.js\n\n该方法用来增强`redux`功能，主要执行过程为，在`dispatch`的时候，按照传入的中间件顺序，依次执行，最后返回一个增强后的`store.dispatch`方法。\n\n这里用到了上面的`compose`方法。\n\n一个注意点，这里首先定义了`dispatch`为一个抛出错误函数，目的是为了防止在中间件构造过程中调用`dispatch`。构造完成后，再将最终的`dispatch`赋值完成。\n\n```javascript\nexport default function applyMiddleware(...middlewares) {\n  // 返回一个参数为createStore的函数\n  return createStore =>\n    (...args) => {\n      // 创建store\n      const store = createStore(...args);\n      // 定义一个dispatch，如果在中间件构造过程中调用，则抛出错误\n      let dispatch = () => {\n        throw new Error(\n          \'Dispatching while constructing your middleware is not allowed. \' +\n            \'Other middleware would not be applied to this dispatch.\'\n        );\n      };\n\n      // 在中间件中要用到的两个方法\n      const middlewareAPI = {\n        getState: store.getState,\n        dispatch: (...args) => dispatch(...args)\n      };\n      // 依次调用middleware，存放在chain数组中\n      const chain = middlewares.map(middleware => middleware(middlewareAPI));\n      // 用compose整合chain数组，并赋值给dispatch\n      dispatch = compose(...chain)(store.dispatch);\n\n      // 返回增强的store\n      return {\n        ...store,\n        dispatch\n      };\n    };\n}\n```\n\n## 手写简易 redux\n\n阅读完了`redux`的源码，来实现一个简易版的`createStore`方法，来实现「redux 简单使用」小节的功能。\n\n实现`createStore`的功能，核心常用的方法就是`subscribe`、`dispatch`、`getState`这三个。\n\n其实核心思路就是定义一个监听者列表，有新订阅时，将其回调函数放入监听者列表。`dispatch`中通过`reducer`更新旧状态，并通知所有订阅者。\n\n```javascript\nfunction createStore(reducer) {\n  // 状态\n  let state;\n  // 监听者列表\n  const listeners = [];\n\n  // 订阅\n  function subscribe(listener) {\n    listeners.push(listener); // 每订阅一个，就为监听器添加一个回调函数\n  }\n\n  // 更新 state\n  function dispatch(action) {\n    // 调用 reducer，更新 state\n    state = reducer(state, action);\n    // 通知所有订阅者\n    listeners.forEach(i => i());\n  }\n\n  // 获取 state\n  function getState() {\n    return state;\n  }\n\n  // 返回 store 对象\n  return {\n    subscribe,\n    dispatch,\n    getState\n  };\n}\n```\n\n\n\n***\n\n> 参考\n>\n> - <a href=\"https://github.com/reduxjs/redux\" target=\"_blank\">redux</a>\n> - <a href=\"https://www.redux.org.cn/\" target=\"_blank\">Redux 中文文档</a>\n> - <a href=\"https://jelly.jd.com/article/61b57c900ef40701ad5d88aa\" target=\"_blank\">用 25 行代码手写一个 Redux</a>', '1648822687000', 'sjis', 'jsaooaj', 0, '', '123');
INSERT INTO `articlelist` VALUES (3, 'aa', 'ssss', '11111111111111', 'aaaaa', 'aaaa', 1, '111111111', NULL);
INSERT INTO `articlelist` VALUES (4, 'cc', 'aaa', '11111111111', 'aaa', 'aaa', 1, '111111111', NULL);
COMMIT;

-- ----------------------------
-- Table structure for classifylist
-- ----------------------------
DROP TABLE IF EXISTS `classifylist`;
CREATE TABLE `classifylist` (
  `id` int NOT NULL,
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of classifylist
-- ----------------------------
BEGIN;
INSERT INTO `classifylist` VALUES (1, 'xxx');
INSERT INTO `classifylist` VALUES (2, '学习');
COMMIT;

-- ----------------------------
-- Table structure for describelist
-- ----------------------------
DROP TABLE IF EXISTS `describelist`;
CREATE TABLE `describelist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of describelist
-- ----------------------------
BEGIN;
INSERT INTO `describelist` VALUES (1, 'hahahhha');
INSERT INTO `describelist` VALUES (2, 'xixixiixxi');
INSERT INTO `describelist` VALUES (3, 'huhuhuhuhuh');
COMMIT;

-- ----------------------------
-- Table structure for say
-- ----------------------------
DROP TABLE IF EXISTS `say`;
CREATE TABLE `say` (
  `id` int NOT NULL,
  `content` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `isshow` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of say
-- ----------------------------
BEGIN;
INSERT INTO `say` VALUES (1, 'hahahha', '1649341088000', 1);
INSERT INTO `say` VALUES (2, 'xixixiix', '1648822687000', 1);
COMMIT;

-- ----------------------------
-- Table structure for saysay
-- ----------------------------
DROP TABLE IF EXISTS `saysay`;
CREATE TABLE `saysay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of saysay
-- ----------------------------
BEGIN;
INSERT INTO `saysay` VALUES (1, 'hahah', '1649344919000');
INSERT INTO `saysay` VALUES (2, 'hhihihi', '1649344919000');
COMMIT;

-- ----------------------------
-- Table structure for tagslist
-- ----------------------------
DROP TABLE IF EXISTS `tagslist`;
CREATE TABLE `tagslist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tagslist
-- ----------------------------
BEGIN;
INSERT INTO `tagslist` VALUES (1, 'c++');
INSERT INTO `tagslist` VALUES (2, 'java');
INSERT INTO `tagslist` VALUES (3, 'c#');
INSERT INTO `tagslist` VALUES (4, 'javascript');
INSERT INTO `tagslist` VALUES (5, 'golang');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` char(255) DEFAULT NULL,
  `avatar` char(255) DEFAULT NULL,
  `sex` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  `password` char(255) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'ylq', 'ylq22', '0', 1, 18, '12345644');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
