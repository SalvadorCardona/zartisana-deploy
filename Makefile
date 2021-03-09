build:
	rm -Rf project
	git clone https://github.com/SalvadorCardona/lacliqueandcollecte.git project
	cd project && make install-php
	cd project && make install-asset

after:
	node node_modules/gulp/bin/gulp.js build
