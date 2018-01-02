var express = require('express');
var router = express.Router();
// var router = require('express').Router();
var authMiddleware = require('../../auth/middlewares/auth');

router.get('/',(req, res) => {
    console.log('=================================');
    console.log('Pumasok sa orgcouncil schedule');
    console.log('=================================');
    res.render('orgcouncil/schedule/views/index');
});

router.get('/addschedule',(req, res) => {
    console.log('=================================');
    console.log('Pumasok sa orgcouncil schedule:ADD SCHEDULE');
    console.log('=================================');
    res.render('orgcouncil/schedule/views/addschedule');
});

module.exports = router;