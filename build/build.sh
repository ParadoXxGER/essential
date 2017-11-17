#!/bin/bash

set -e

docker-compose up --build --abort-on-container-exit

echo "Worked!"