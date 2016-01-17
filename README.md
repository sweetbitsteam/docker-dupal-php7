# PHP7 Drupal environment using docker
This repo contains docker specific configurations for starting Drupal environment. It includes:

* PHP7 with Apache
* Git
* Composer
* Drush
* Drupal Console


# Usage
1. Clone this repo as a folder named according to your project;
2. Rename `docker-compose.example.yml` to `docker-compose.yml`;
3. Edit `docker-compose.yml` file according to your project needs. (e.g. change `project` image name to whatever you want. Change `./path/to/your/project` under volumes key.)
4. Create mysql Data only container `docker run -d --name projectdb-data-container mysql:5.5 --entrypoint /bin/echo MySQL data-only container`.
5. Build `docker-compose build | tee ./build.log`.
6. `docker-compose up -d` - Start docker containers.

Tip: You can replace word `project` to your project name, so your containers will be named after you project name.



## Useful Commands & usage example

### Commands
* `docker run -d --name projectdb-data-container mysql:5.5 --entrypoint /bin/echo MySQL data-only container for Drupal project example`
* `docker-compose build | tee ./build.log` - Build according to docker-compose.yml file.
* `docker-compose up -d` - Start docker containers.
* `docker stop $(docker ps -a -q)` - Stop all docker containers.
* `docker rm $(docker ps -a -q)` - Remove all docker containers.

### Usage example

Create folder named `Docker` in your main workspace directory and everytime you start new project just clone this repo and name it whatever your project's name is.

Replace every occurrence of word `project` with your project name, so your containers will be named after you project name.


Change `volumes` pointing it to your source project.

If you are createing new project start using drupal project template accroding to [drupal-composer/drupal-project](https://github.com/drupal-composer/drupal-project)
