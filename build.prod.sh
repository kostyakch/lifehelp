#!/bin/bash

[ -f .env ] && source .env

# build backend
docker-compose -f docker-compose-staging.yml down

docker volume prune -f
rm -fr public/assets/
rm -fr public/packs/

docker-compose -f docker-compose-staging.yml build
docker-compose -f docker-compose-staging.yml down
