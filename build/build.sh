#!/bin/bash

set -e

docker-compose up --build --abort-on-container-exit

echo "################ SUCCESS ################"

docker build -t paradoxxger/essential-backend:latest ../