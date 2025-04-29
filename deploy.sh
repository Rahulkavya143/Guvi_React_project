#!/bin/bash

echo "Deploying the Application..."

ssh -i /var/lib/jenkins/My_project.pem -o StrictHostKeyChecking=no ubuntu@13.200.124.200 << EOF
  docker pull rahulr143/react-app-prod:latest
  docker stop react-container || true
  docker rm react-container || true
  docker run -d -p 3000:3000 --name react-container rahulr143/react-app-prod:latest
EOF

