install:
	yarn install

build:
	rm -Rf project project.zip
	git clone https://github.com/SalvadorCardona/lacliqueandcollecte.git project
	cd project && make install-php
	cd project && make install-asset
	zip -r project.zip project


after:
	node node_modules/gulp/bin/gulp.js build
