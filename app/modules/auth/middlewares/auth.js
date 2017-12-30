exports.hasAuth = (req, res, next) => {
    // console.log(req.session);
    console.log(req.session.student);
    if (req.session && req.session.student && Object.keys(req.session.student).length > 0) return next();
    return res.redirect('/home');
}

exports.noAuthed = (req, res, next) => {
    if (req.session && req.session.student && Object.keys(req.session.student).length > 0) return res.redirect('/student');
    return next();
}

exports.hasAuthadmin = (req, res, next) => {
    if (req.session && req.session.admin && Object.keys(req.session.admin).length > 0) return next();
    return res.redirect('/login?unauthorized');
}

exports.noAuthedadmin = (req, res, next) => {
    if (req.session && req.session.admin && Object.keys(req.session.admin).length > 0) return res.redirect('/home');
    return next();
}


