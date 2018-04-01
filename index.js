require('dotenv').config();

var express = require('express');
var winston = require('winston');
var app = express();
var func = require('./app/index.js');
func(app);

app.listen(app.get('port'), () => {
    winston.info(`Irregular Please is on PORT:${app.get('port')}`);
});