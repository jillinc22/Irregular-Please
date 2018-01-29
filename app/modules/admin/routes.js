var router = require('express').Router();
var authMiddleware = require('../auth/middlewares/auth');

router.use(authMiddleware.hasAuthadmin);

router.use('/', require('./home/routes'));
router.use('/admin/viewstudent', require('./home/routes'));

router.use('/orgcouncil', require('./orgcouncil/routes'));
router.use('/orgcouncil/addorgcouncil', require('./orgcouncil/routes'));

router.use('/schedules', require('./schedules/routes'));

router.use('/petition', require('./petition/routes'));

router.use('/profile', require('./profile/routes'));
router.use('/profile/editprofile', require('./profile/routes'));

exports.admin = router;