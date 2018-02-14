#!/bin/bash

ssh $APP_USER@$APP_HOST <<ENDSSH
  echo "changing dir to ./apps/$APP_NAME"
  cd ./apps/$APP_NAME;
  echo "Cycling power on $APP_NAME"
  docker-compose down;
  docker-compose up;
  echo "Cycled power on $APP_NAME"
ENDSSH

ssh $APP_USER@$APP_HOST <<ENDSSH
  echo "Changing dir to ./nginx"
  cd ./nginx;
  echo "Cycling power on the Nginx container"
  docker-compose down;
  docker-compose up;
  echo "Cycled power on Nginx"
ENDSSH
