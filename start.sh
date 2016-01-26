#!/bin/bash


# spin up all nessecery containers
docker run -d --name projectdb-data-container mysql:5.6 --entrypoint /bin/echo MySQL data-only container
docker-compose build | tee ./build.log
docker-compose up -d