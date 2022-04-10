'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  require('./router/backEnd/index')(app);
  require('./router/frontEnd/index')(app);
};
