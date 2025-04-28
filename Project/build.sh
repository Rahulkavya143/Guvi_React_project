#!/bin/bash

# Accept branch name as argument
BRANCH_NAME=$(basename "$1")

echo "Branch received: $BRANCH_NAME"

# Set the image name based on the branch
if [ "$BRANCH_NAME" == "main" ]; then
    IMAGE_NAME="rahulr143/prod:latest"
else
    IMAGE_NAME="rahulr143/dev:latest"
fi

echo "Building Docker image: $IMAGE_NAME"

# Build the docker image
docker build -t $IMAGE_NAME .

echo "Docker image $IMAGE_NAME built successfully!"
