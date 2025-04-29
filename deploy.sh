#!/bin/bash

echo "Deploying the Application..."

BRANCH_NAME="$1"

if [ "$BRANCH_NAME" == "main" ]; then
  IMAGE="rahulr143/react-app-prod:latest"
else
  IMAGE="rahulr143/react-app-dev:latest"
fi

ssh -o StrictHostKeyChecking=no ubuntu@<YOUR_EC2_PUBLIC_IP> << EOF
docker pull $IMAGE
docker stop react-app || true
docker rm react-app || true
docker run -d --name react-app -p 80:3000 $IMAGE
EOF
