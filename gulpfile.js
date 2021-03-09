const gulp = require( 'gulp' );
const { series } = require('gulp');
const { exec } = require('child_process');
require('dotenv').config();
const sftp = require('gulp-sftp');

const connection = sftp({
    host: process.env.FTP_HOST,
    user: process.env.FTP_USER,
    pass: process.env.FTP_PASSWORD,
    remotePath: '/landl',
    port: 22
});

function build(cb) {
    return gulp.src(['project/**'])
        .pipe(connection);
    cb();
}

exports.build = build;
exports.default = series(build);