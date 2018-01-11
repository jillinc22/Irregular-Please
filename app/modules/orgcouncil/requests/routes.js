var express = require('express');
var router = express.Router();
var authMiddleware = require('../../auth/middlewares/auth');
var db = require('../../../lib/database')();


router.get('/',(req, res) => {
    console.log('=================================');
    console.log('ORG/COUNCIL REQUESTS:');
    console.log('=================================');
   
    var queryString =`SELECT * FROM tbl_user WHERE varchar_userStatus = "Not Approved" AND (varchar_userType = "Officer" OR varchar_userType = "Student")`
    db.query(queryString, (err, results, fields) => {
        if (err) console.log(err);
        console.log(results);
        res.render('orgcouncil/requests/views/index', {tbl_user:results});
    });
});

router.post('/:int_userID/remove', (req, res) => {
    const queryString = `UPDATE tbl_user SET        
    varchar_userstatus = "Not Approved"
    WHERE int_userID= ${req.params.int_userID}`;
    
    db.query(queryString, (err, results, fields) => {        
        if (err) throw err;
        res.redirect('/orgcouncil/requests');
    });
});

router.get('/:int_userID/approve', (req, res) => {

    const queryString = `UPDATE tbl_user SET        
    varchar_userStatus = "Approved"
    WHERE int_userID= ${req.params.int_userID}`;

    db.query(queryString, (err, results, fields) => {        
        if (err) throw err;
        res.redirect('/orgcouncil/requests');
    });
});

module.exports = router;