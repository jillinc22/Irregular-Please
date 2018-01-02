var express = require('express');
var router = express.Router();
// var router = require('express').Router();
var authMiddleware = require('../../auth/middlewares/auth');

router.get('/',(req, res) => {
    console.log('=================================');
    console.log('Pumasok sa orgcouncil requests');
    console.log('=================================');
    res.render('orgcouncil/requests/views/index');
});

module.exports = router;