install: # установить зависимости
	bundle install
lint:
	rubocop
test:
	RAILS_LOCALE=en bin/rails test
	bin/rails test