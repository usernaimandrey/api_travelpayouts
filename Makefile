setup:
	bin/setup
	bin/rails db:seed

clean:
	bin/rails db:drop

db-reset:
	bin/rails db:drop
	bin/rails db:create
	bin/rails db:migrate

start:
	bin/rails s -p 3000 -b "0.0.0.0"

console:
	bin/rails console

lint:
	bundle exec rubocop
	
lint-fix:
	bundle exec rubocop -A

test:
	bin/rails test

.PHONY: test