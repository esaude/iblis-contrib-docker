[![iLab Africa](https://cloud.githubusercontent.com/assets/668093/15218567/cfdc111e-1860-11e6-84e5-19ae44add33e.png)](http://www.ilabafrica.ac.ke/)

# iBLIS Docker

> Docker containers for [iBLIS](https://github.com/ilabafrica/iBLIS)

This repository contains the necessary infrastructure code and related resources
required to compose and run Docker containers that start an instance
of the [iLab Africa](http://www.ilabafrica.ac.ke/) [iBLIS application](https://github.com/ilabafrica/iBLIS).

## Running

### Prerequisites

Make sure you have [Docker](https://docs.docker.com/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.

### Composition

To run containers use the prebuilt images, first get the compose file:

```
wget https://raw.githubusercontent.com/esaude/iblis-contrib-docker/master/docker-compose-prebuilt.yml
```

Then pull the images:

```
docker-compose -f docker-compose-prebuilt.yml pull
```

Once the pull is complete, you'll have to make sure that the mariadb container
is initialized due to [this limitation](https://github.com/docker-library/mysql/issues/81).
Do this by running the following:

````
docker-compose -f docker-compose-prebuilt.yml up iblis-mariadb
````

When it's done you can press <kbd>ctrl+c</kbd> to stop the container. You will only have
to do this the first time.

After this you can run iBLIS by executing the following:

````
docker-compose -f docker-compose-prebuilt.yml up
````

## Access

To log into iBLIS, use the following details:

* **Host**: [http://`DOCKER_HOST`](http://localhost)
* **User**: administrator
* **Pass**: password

## Building

### Prerequisites

Make sure you have [Docker](https://docs.docker.com/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.

### Setup

Start by cloning this repository:

````
git clone https://github.com/esaude/iblis-contrib-docker
````

Enter the directory and build the images:

````
cd iblis-contrib-docker
docker-compose build
````

Once the build is complete, you'll have to make sure that the mariadb container
is initialized due to [this limitation](https://github.com/docker-library/mysql/issues/81).
Do this by running the following:

````
docker-compose up iblis-mariadb
````

When it's done you can press <kbd>ctrl+c</kbd> to stop the container. You will only have
to do this the first time.

After this you can run iBLIS by executing the following:

````
docker-compose up
````

## Troubleshooting

> [PDOException]<br/>
> SQLSTATE[HY000] [2002] Connection refused

Since it's not currently possible to order the startup of Docker containers,
sometimes the Nginx container will start before the MariaDB container. As a result,
iBLIS might not get a database connection on start up. To work around this,
stop the containers and restart them:

````
docker-compose stop
docker-compose start
````

Or if you are using the prebuilt images:

````
docker-compose -f docker-compose-prebuilt.yml stop
docker-compose -f docker-compose-prebuilt.yml start
````

## License

[MPL 2.0 w/ HD](http://openmrs.org/license/)
