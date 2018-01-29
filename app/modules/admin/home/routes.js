var express = require('express');
var router = express.Router();
var authMiddleware = require('../../auth/middlewares/auth');
var db = require('../../../lib/database')();


router.get('/',(req, res) => {
    console.log('=================================');
    console.log('ADMIN HOME');
    console.log('=================================');
   
    var queryString =`SELECT * FROM tbl_user WHERE varchar_userType="Student"`
    db.query(queryString, (err, results, fields) => {
        // var tbl_students=results;
        if (err) console.log(err);
        console.log(results);
        // req.session.tbl_students=tbl_students;
        // req.session.tbl_results=results;
        // console.log("==============REQ.SESSION STUDENTS================");
        // console.log(req.session.tbl_students);
        // console.log("==============REQ.SESSION STUDENTS================");
        res.render('admin/home/views/index', {tbl_students:results,view_student:req.session.tbl_students});
    });
});

router.get('/:int_userID/viewstudent',(req, res) => {
    console.log('=================================');
    console.log('ADMIN VIEW STUDENT:');
    console.log('=================================');
   
    // var queryString =`SELECT * FROM tbl_user WHERE varchar_userType="Student"`
    // db.query(queryString, (err, results, fields) => {
    //     if (err) console.log(err);
    //     console.log("==============RESULTS=============");
    //     console.log(results);
    //     console.log("==============RESULTS=============");
        // res.render('admin/home/views/index', {tbl_user:results});

        var queryString2 =`SELECT * FROM tbl_user WHERE int_userID=${req.params.int_userID}`
        db.query(queryString2, (err, results, fields) => {
            if (err) console.log(err);
            console.log("============RESULTS1==============");
            console.log(results);
            console.log("============RESULTS1==============");
            res.render('admin/home/views/index',{view_student:results, tbl_students:req.session.tbl_students});
        // });
    });
});


// exports.home = homepage;
module.exports = router;