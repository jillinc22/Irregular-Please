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

exports.hasAuthOrgCouncil = (req, res, next) => {
    if (req.session && req.session.orgcouncil && Object.keys(req.session.orgcouncil).length > 0) return next();
    return res.redirect('/home');
}

exports.noAuthOrgCouncil = (req, res, next) => {
    if (req.session && req.session.orgcouncil && Object.keys(req.session.orgcouncil).length > 0) return res.redirect('/orgcouncil');
    return next();
}

exports.hasAuthOfficer = (req, res, next) => {
    if (req.session && req.session.officer && Object.keys(req.session.officer).length > 0) return next();
    return res.redirect('/home');
}

exports.noAuthOrgOfficer = (req, res, next) => {
    if (req.session && req.session.officer && Object.keys(req.session.officer).length > 0) return res.redirect('/officer');
    return next();
}


