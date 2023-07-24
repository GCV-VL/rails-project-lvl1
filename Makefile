install: # установить зависимости
	bundle install
lint:
	bundle exec rubocop
test:
	bundle exec rake test

.PHONY: test