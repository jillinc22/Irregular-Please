var router = require('express').Router();
var authMiddleware = require('../auth/middlewares/auth');

router.use(authMiddleware.hasAuthadmin);

router.use('/', require('./home/routes'));

router.use('/requests', require('./requests/routes'));

router.use('/orgcouncil', require('./orgcouncil/routes'));
router.use('/orgcouncil/addorgcouncil', require('./orgcouncil/routes'));

router.use('/lists', require('./lists/routes'));

router.use('/profile', require('./profile/routes'));
router.use('/profile/editprofile', require('./profile/routes'));

exports.admin = router;