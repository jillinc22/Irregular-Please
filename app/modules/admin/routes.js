var router = require('express').Router();
var authMiddleware = require('../auth/middlewares/auth');

router.use(authMiddleware.hasAuthadmin);

router.use('/', require('./home/routes'));

exports.admin = router;