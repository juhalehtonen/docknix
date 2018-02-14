#!/bin/bash

ssh $APP_USER@$APP_HOST <<ENDSSH
  echo "changing dir to ./apps/$APP_NAME"
  cd ./apps/$APP_NAME;
  echo "Stopping $APP_NAME"
  ./bin/$APP_NAME stop;
ENDSSH

ssh $APP_USER@$APP_HOST <<ENDSSH
  echo "changing dir to ./apps/$APP_NAME"
  cd ./apps/$APP_NAME;
  echo "Starting $APP_NAME"
  PORT=4000 ./bin/$APP_NAME start;
  echo "Finished"
ENDSSH
