#!/bin/sh

# This script first builds the release builder image using Dockerfile.build, and then it runs the container, with a volume connected to the host machine's rel/ directory. This way, when the container is run, the release is built inside of the rel/ directory inside of the container but the release remains on the host machine in the same directory after the container exists. Remember, since the release is built inside the container for the Alpine Linux architecture, you will probably not be able to run this release on your host machine.

# Note: You will most likely have to add execution permissions to this file using sudo chmod +x build.sh.

# Remove old releases
rm -rf _build/prod/rel/*

# Build the image
docker build --rm -t docknix-build -f Dockerfile.build . -e DOCKNIX_RELEASE_COOKIE=$(DOCKNIX_RELEASE_COOKIE) \
-e DOCKNIX_SECRET_KEY_BASE=$(DOCKNIX_SECRET_KEY_BASE) \
-e DOCKNIX_DB_USER=$(DOCKNIX_DB_USER) \
-e DOCKNIX_DB_PASS=$(DOCKNIX_DB_PASS)

# Run the container
docker run -e DOCKNIX_RELEASE_COOKIE=$DOCKNIX_RELEASE_COOKIE \
-e DOCKNIX_SECRET_KEY_BASE=$DOCKNIX_SECRET_KEY_BASE \
-e DOCKNIX_DB_USER=$DOCKNIX_DB_USER \
-e DOCKNIX_DB_PASS=$DOCKNIX_DB_PASS \
-it --rm --name docknix-build -v $(pwd)/_build/prod/rel:/opt/app/_build/prod/rel docknix-build
