REPORTER = dot
TESTS = $(find ./test -type f -name '*.js' ! -name 'common.js')

build:
	@mkdir -p build
	@browserify -e entry.coffee -p ifnodeify -r 'debug/debug.component' -a 'debug:debug/debug.component' -o build/engine.ns.io-client.js 

clean:
	@rm build -rf

test:
	@mocha \
		--reporter $(REPORTER) \
		$(TESTS)

.PHONY: test build dist
