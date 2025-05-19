#!/bin/bash

# Set app name
APP_NAME="go-docker-app"
CONTAINER_NAME="${APP_NAME}-container"

if ! docker image inspect $APP_NAME > /dev/null 2>&1; then
    echo "Building Docker image..."
    docker build -t $APP_NAME .
else
    echo "Docker image already Exists: $APP_NAME"
fi

if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    echo "Starting existing container: $CONTAINER_NAME"
    docker start -a $CONTAINER_NAME
else
    echo "Creating and Running new DocKer container: $CONTAINER_NAME"
    docker run -p 8080:8080 --name $CONTAINER_NAME $APP_NAME
fi