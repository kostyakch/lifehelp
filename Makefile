#TODO: convert it to ansible playbook (in the sake of idempotence)

db_create:
	bundle exec rake db:create

db_migrate:
	RAILS_ENV=development bundle exec rake db:migrate
	RAILS_ENV=test bundle exec rake db:migrate

db_drop:
	bundle exec rake db:drop

db_rollback:
	RAILS_ENV=development bundle exec rake db:rollback
	RAILS_ENV=test bundle exec rake db:rollback

fix:
	bundle exec rubocop --auto-correct

test:
	RAILS_ENV=test bundle exec rspec $T

docker_bash:
	docker-compose run --rm backend bash

docker_test:
	docker-compose run --rm backend rspec
