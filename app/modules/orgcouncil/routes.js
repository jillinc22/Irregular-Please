var router = require('express').Router();
var authMiddleware = require('../auth/middlewares/auth');

router.use(authMiddleware.hasAuthOrgCouncil);

router.use('/', require('./home/routes'));

router.use('/schedule', require('./schedule/routes'));
router.use('/schedule/addschedule', require('./schedule/routes'));

router.use('/announcements', require('./announcements/routes'));

router.use('/requests', require('./requests/routes'));

router.use('/lists', require('./lists/routes'));

router.use('/profile', require('./profile/routes'));

exports.orgcouncil = router;