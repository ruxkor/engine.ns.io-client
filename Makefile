
REPORTER = dot
TESTS = $(find ./test -type f -name '*.js' ! -name 'common.js')

build:
	@mkdir -p build
	@browserify -e entry.coffee -p ifnodeify -o build/engine.ns.io-client.js

clean:
	@rm build -rf

test:
	@./node_modules/.bin/mocha \
		--reporter $(REPORTER) \
		$(TESTS)

.PHONY: test build dist
