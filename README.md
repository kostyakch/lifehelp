# Volunteer Assistance Accounting Application

## Setup
### Build image
```sh
docker-compose build
```

### initialize
```sh
docker-compose run backend rake db:create
docker-compose run backend rake db:migrate
docker-compose down
```

### Start container
```sh
docker-compose up
```
