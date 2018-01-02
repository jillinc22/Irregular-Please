var router = require('express').Router();
var authMiddleware = require('../auth/middlewares/auth');

router.use(authMiddleware.hasAuthOfficer);

router.use('/', require('./home/routes'));

router.use('/announcements', require('./announcements/routes'));

router.use('/group', require('./group/routes'));

router.use('/profile', require('./profile/routes'));

exports.officer = router;