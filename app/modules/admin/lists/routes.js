var express = require('express');
var router = express.Router();
var authMiddleware = require('../../auth/middlewares/auth');
var db = require('../../../lib/database')();

router.get('/',(req, res) => {
    console.log('=================================');
    console.log('ADMIN LISTS:');
    console.log('=================================');
   
    var queryString =`SELECT * FROM tbl_user`
    db.query(queryString, (err, results, fields) => {
        if (err) console.log(err);
        console.log(results);
        res.render('admin/lists/views/index', {tbl_user:results});
    });
});


// exports.home = homepage;
module.exports = router;