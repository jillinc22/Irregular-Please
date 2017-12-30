var router = require('express').Router();
var authMiddleware = require('../auth/middlewares/auth');

router.use(authMiddleware.hasAuth);

router.use('/', require('./home/routes'));

exports.student = router;