#TODO: convert it to ansible playbook (in the sake of idempotence)

db_create:
	rake db:create

db_migrate:
	RAILS_ENV=development rake db:migrate
	RAILS_ENV=test rake db:migrate

db_drop:
	rake db:drop

db_rollback:
	RAILS_ENV=development rake db:rollback
	RAILS_ENV=test rake db:rollback

fix:
	bundle exec rubocop --auto-correct

test:
	RAILS_ENV=test bundle exec rspec $T

docker_bash:
	docker-compose run --rm backend bash

docker_test:
	docker-compose run --rm backend rspec
