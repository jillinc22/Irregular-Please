var express = require('express');
var router = express.Router();
// var router = require('express').Router();
var authMiddleware = require('../../auth/middlewares/auth');

router.get('/',(req, res) => {
    console.log('=================================');
    console.log('Pumasok sa orgcouncil announcements');
    console.log('=================================');
    res.render('orgcouncil/announcements/views/index');
});

module.exports = router;