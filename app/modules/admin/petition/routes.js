var express = require('express');
var router = express.Router();
var authMiddleware = require('../../auth/middlewares/auth');
var db = require('../../../lib/database')();

router.get('/',(req, res) => {
    console.log('=================================');
    console.log('ADMIN MANAGE SCHEDULES:');
    console.log('=================================');
   
    var queryString =`SELECT * FROM tbl_org`
    db.query(queryString, (err, results, fields) => {
        if (err) console.log(err);
        console.log(results);
        res.render('admin/petition/views/index');
    });
});



module.exports = router;