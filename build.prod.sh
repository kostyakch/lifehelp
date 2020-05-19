#!/bin/bash

[ -f .env ] && source .env

# build backend
docker volume prune -f
docker-compose -f docker-compose-staging.yml build
docker-compose -f docker-compose-staging.yml run backend rake assets:precompile
docker-compose -f docker-compose-staging.yml down
