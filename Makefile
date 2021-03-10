include .env

install:
	yarn install
	cp .env.preprod .env

build:
	rm -Rf master master.zip lacliqueandcollecte-master
	wget https://github.com/SalvadorCardona/lacliqueandcollecte/archive/master.zip
	unzip master.zip
	cd lacliqueandcollecte-master && make install-php
	cd lacliqueandcollecte-master && make install-asset
	zip -r master.zip lacliqueandcollecte-master
	sshpass -p ${FTP_PASSWORD} scp master.zip ${FTP_USER}@${FTP_HOST}:./landl/test
	sshpass -p ${FTP_PASSWORD} ssh ${FTP_USER}@${FTP_HOST} unzip ./landl/test/master.zip
	rm -Rf master master.zip lacliqueandcollecte-master

