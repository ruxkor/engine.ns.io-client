
REPORTER = dot
TESTS = $(find ./test -type f -name '*.js' ! -name 'common.js')

build:
	@find lib -name '*.coffee' | xargs coffee -c

build-dist:
	@# build base if not already built
	@make -C ./node_modules/engine.ns.io-base build
	@./node_modules/.bin/browserbuild \
		-g nsio \
		-f lib/engine.ns.io.js \
		-m engine.ns.io-client 
		lib/
	@# cd node_modules/engine.ns.io-base; ls lib/*.js 2>/dev/null && make clean


dist: build build-dist

clean:
	@find lib -name '*.coffee' | sed 's,coffee$$,js,' | xargs rm -f

test:
	@./node_modules/.bin/mocha \
		--reporter $(REPORTER) \
		$(TESTS)

.PHONY: test build dist
