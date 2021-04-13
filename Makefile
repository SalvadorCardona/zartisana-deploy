include .env
BUILD_FOLDER=lacliqueandcollecte-master
BUILT_FOLDER=lacliqueandcollecte-master-builded

install:
	cp .env.preprod .env

build-on-integration:
	rm -Rf master master.zip ${BUILD_FOLDER} ${BUILT_FOLDER}
	mkdir ${BUILT_FOLDER}
	wget https://github.com/SalvadorCardona/lacliqueandcollecte/archive/master.zip
	unzip master.zip
	cd ${BUILD_FOLDER} && make install-php
	cd ${BUILD_FOLDER} && make install-asset
	cp -r ${BUILD_FOLDER}/vendor ${BUILD_FOLDER}/web ${BUILD_FOLDER}/src ${BUILD_FOLDER}/theme ${BUILD_FOLDER}/config ${BUILD_FOLDER}/composer.json ${BUILT_FOLDER}
	cd ${BUILT_FOLDER} && zip -r master.zip ./ && mv master.zip ./..
	sshpass -p ${FTP_PASSWORD} scp master.zip ${FTP_USER}@${FTP_HOST}:./${FTP_PATH_FOLDER}
	sshpass -p ${FTP_PASSWORD} ssh ${FTP_USER}@${FTP_HOST} unzip -o ./${FTP_PATH_FOLDER}/master.zip -d ${FTP_PATH_FOLDER}
	sshpass -p ${FTP_PASSWORD} ssh ${FTP_USER}@${FTP_HOST} cp -R ./${FTP_PATH_FOLDER}/theme ./${FTP_PATH_FOLDER}/web/app/themes/hello-theme-master
	rm -Rf master master.zip ${BUILD_FOLDER} ${BUILT_FOLDER}

