const { series } = require('gulp');
const { exec } = require('child_process');

// The `build` function is exported so it is public and can be run with the `gulp` command.
// It can also be used within the `series()` composition.
function build(cb) {
    exec("git clone https://github.com/SalvadorCardona/lacliqueandcollecte.git project", (error, stdout, stderr) => {
        if (error) {
            console.log(`error: ${error.message}`);
            return;
        }
        if (stderr) {
            console.log(`stderr: ${stderr}`);
            return;
        }
        console.log(`stdout: ${stdout}`);
    });
    console.log('cleantest')
  // body omitted
  cb();
}

exports.build = build;
exports.default = series(build);