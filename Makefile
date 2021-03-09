include .env

install:
	yarn install
	cp .env.preprod .env

build:
	rm -Rf project project.zip
	git clone https://github.com/SalvadorCardona/lacliqueandcollecte.git project
	cd project && make install-php
	cd project && make install-asset
	zip -r project.zip project
	sshpass -p ${FTP_PASSWORD} scp project.zip ${FTP_USER}@${FTP_HOST}:./landl/test
	sshpass -p ${FTP_PASSWORD} ssh ${FTP_USER}@${FTP_HOST} unzip ./landl/test/project.zip


