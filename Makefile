install: # установить зависимости
	bundle install
lint:
	rubocop
test:
	rake test

.PHONY: test