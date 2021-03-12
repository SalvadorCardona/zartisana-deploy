include .env
FOLDER_NAME=lacliqueandcollecte-master

install:
	cp .env.preprod .env

build:
	rm -Rf master master.zip ${FOLDER_NAME}
	wget https://github.com/SalvadorCardona/lacliqueandcollecte/archive/master.zip
	unzip master.zip
	cd ${FOLDER_NAME} && make install-php
	cd ${FOLDER_NAME} && make install-asset
	rm -R ${FOLDER_NAME}/assets
	rm ${FOLDER_NAME}/.env
	cd ${FOLDER_NAME} && zip -r master.zip ./ && mv master.zip ./..
	sshpass -p ${FTP_PASSWORD} scp master.zip ${FTP_USER}@${FTP_HOST}:./${FTP_PATH_FOLDER}
	sshpass -p ${FTP_PASSWORD} ssh ${FTP_USER}@${FTP_HOST} unzip -o ./${FTP_PATH_FOLDER}/master.zip -d ${FTP_PATH_FOLDER}
	rm -Rf master master.zip ${FOLDER_NAME}

