var express = require('express');
var router = express.Router();
// var router = require('express').Router();
var authMiddleware = require('../../auth/middlewares/auth');

router.get('/',(req, res) => {
    console.log('=================================');
    console.log('Pumasok sa student announcements');
    console.log('=================================');
    res.render('student/announcements/views/index');
});



// exports.home = homepage;
module.exports = router;