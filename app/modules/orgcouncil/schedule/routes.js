var express = require('express');
var router = express.Router();
// var router = require('express').Router();
var authMiddleware = require('../../auth/middlewares/auth');
var db = require('../../../lib/database')();

router.get('/',(req, res) => {
    console.log('=================================');
    console.log('Pumasok sa orgcouncil schedule');
    console.log('=================================');
    
    db.query('SELECT varchar_courseTitle, varchar_schedDay, varchar_schedTime, varchar_schedRoom, varchar_schedProf FROM tbl_sched INNER JOIN tbl_course ON tbl_sched.char_courseCode=tbl_course.char_courseCode', (err, results, fields) => {
        if (err) console.log(err)
        return res.render('orgcouncil/schedule/views/index', { tbl_sched: results });
    });
});

router.post('/', (req, res) => {
    var queryString = `tbl_sched INNER JOIN tbl_course ON tbl_sched.char_courseCode=tbl_course.char_courseCode(
    \`varchar_courseTitle\`,
    \`varchar_schedDay\`,
    \`varchar_schedTime\`,
    \`varchar_schedRoom\`,
    \`varchar_schedProf\`)  
    
    
    VALUES(
    "${req.body.coursetitle}",
    "${req.body.schedday}",
    "${req.body.schedtime}",
    "${req.body.schedroom}",
    "${req.body.schedprof}")`;
   

    db.query(queryString, (err, results, fields) => {        
        if (err) throw err;
        res.redirect('orgcouncil/schedule');
    });
});


module.exports = router;

module.exports = router;

module.exports = router;