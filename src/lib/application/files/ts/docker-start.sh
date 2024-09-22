#!/bin/bash

if [ -f ".env" ]; then
    mv .env .env.bak
fi

## move env-example to .env
cp env-example .env
docker compose up -d

LOGGING_DIR="./docker/logging"

if [ -d "$LOGGING_DIR" ]; then

  cd "$LOGGING_DIR"

  docker compose up -d

  cd ../..

fi

MONITOR_DIR="./docker/monitor"

if [ -d "$MONITOR_DIR" ]; then
  cd "$MONITOR_DIR"
  
  docker compose up -d

  cd ../..

fi

TEMPORAL_DIR="./docker/temporal"

if [ -d "$TEMPORAL_DIR" ]; then

  cd "$TEMPORAL_DIR"

  docker compose up -d

  cd ../..

fi
