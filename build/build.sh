#!/bin/bash

DATE=`date +%Y-%m-%d`

set -e

docker-compose up --build --abort-on-container-exit

echo "################ SUCCESS ################"

docker build -t paradoxxger/essential-backend:latest-$DATE ../

docker push paradoxxger/essential-backend:latest-$DATE