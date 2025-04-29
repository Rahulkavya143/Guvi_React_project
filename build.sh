#!/bin/bash

echo "Building the Docker Image..."

BRANCH_NAME=$(basename "$1")

if [ "$BRANCH_NAME" == "main" ]; then
  IMAGE="rahulr143/react-app-prod:latest"
else
  IMAGE="rahulr143/react-app-dev:latest"
fi

docker build -t $IMAGE .
