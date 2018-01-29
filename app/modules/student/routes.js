var router = require('express').Router();
var authMiddleware = require('../auth/middlewares/auth');

router.use(authMiddleware.hasAuth);

router.use('/', require('./home/routes'));

router.use('/announcements', require('./announcements/routes'));

router.use('/schedule', require('./schedule/routes'));

router.use('/petition', require('./petition/routes'));


router.use('/profile', require('./profile/routes'));
router.use('/profile/editprofile', require('./profile/routes'));

exports.student = router;