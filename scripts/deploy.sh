#!/bin/bash
set -ex

# Log in to the Bintray Docker registry
docker login -u $BINTRAY_USER -p $BINTRAY_API_KEY -e $BINTRAY_EMAIL esaude-docker-iblis-docker.bintray.io

# Tag the nginx image
docker tag `docker images -q ibliscontribdocker_iblis-nginx` esaude-docker-iblis-docker.bintray.io/nginx:$TRAVIS_TAG

# Push the nginx image
docker push esaude-docker-iblis-docker.bintray.io/nginx:$TRAVIS_TAG

# Tag the mariadb image
docker tag `docker images -q ibliscontribdocker_iblis-mariadb` esaude-docker-iblis-docker.bintray.io/mariadb:$TRAVIS_TAG

# Push the mariadb image
docker push esaude-docker-iblis-docker.bintray.io/mariadb:$TRAVIS_TAG
