#!/bin/bash

docker run -d --name projectdb-data-container mysql:5.5 --entrypoint /bin/echo MySQL data-only container
docker-compose build | tee ./build.log
docker-compose up -d