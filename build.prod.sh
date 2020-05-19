#!/bin/bash

[ -f .env ] && source .env

# build backend
docker-compose -f docker-compose-staging.yml build
docker-compose -f docker-compose-staging.yml run backend rake assets:precompile
docker-compose -f docker-compose-staging.yml down
