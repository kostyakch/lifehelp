#!/bin/sh
while ! nc -z db 5432;
do
  echo Waiting for Postgres...;
  sleep 3;
done;
echo Connected to Postgres!;
echo Starting application...;

bundle exec rails server -b 0.0.0.0
