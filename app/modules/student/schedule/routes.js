var express = require('express');
var router = express.Router();
var authMiddleware = require('../../auth/middlewares/auth');
var db = require('../../../lib/database')();

router.get('/',(req, res) => {
    console.log('=================================');
    console.log('Pumasok sa student schedule');
    console.log('=================================');
    res.render('student/schedule/views/index');
});

router.post('/search_course', (req, res) => {
    
    var queryString1 = `SELECT * FROM tbl_sched WHERE char_courseCode="${req.body.course_search}"`
    db.query(queryString1, (err, results, fields) => {
        if (err) throw err;
        console.log("=====================");
        console.log("SEARCH COURSE CODE .......",results);
        console.log("=====================");
        res.render('student/schedule/views/index2', {search_course:results});
    });
});



// exports.home = homepage;
module.exports = router;