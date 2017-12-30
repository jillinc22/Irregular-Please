var express = require('express');
var homepage = express.Router();
var signup = express.Router();
var authMiddleware = require('./middlewares/auth');

homepage.get('/',authMiddleware.noAuthed,(req, res) => {

    res.render('auth/views/index');
    
});

homepage.post('/', (req, res) =>{
    
    console.log('PUMASOK SA POST NG HOME MODAL');

    var db = require('../../lib/database')();
    db.query(`SELECT * FROM tbl_user WHERE varchar_email="${req.body.user_email}"`, (err, results, fields) => {
        if (err) throw err;
        if (results.length === 0) return res.redirect('/login?incorrect');

        var user = results[0];
        
        if (user.varchar_password !== req.body.user_password) return res.redirect('/login?incorrect');
        
        if(user.varchar_usertype == "Admin"){
            delete user.varchar_password;
            req.session.admin = user;
            console.log("Admin User:");
            console.log('Admin: '+user.varchar_email);
            return res.redirect('/admin');
            
        }
        if(user.varchar_usertype == "Student"){
            delete user.varchar_password;
            req.session.student = user;
            console.log('Student User:');
            console.log('Student: '+user.varchar_email);
            return res.redirect('/student');
        }
        if(user.varchar_usertype == "Org/Counci"){
            delete user.varchar_password;
            req.session.orgcouncil = user;
            console.log('Orgs/Council User:');
            res.end("Org/Council siya");
            console.log('Org/Council: '+user.varchar_email);
            // return res.redirect('/orgcouncil');
        }
    });

});

signup.get('/', (req,res) => {
    res.render('auth/views/signup');
});



exports.home = homepage;
exports.signup = signup;
// router.exports = router;