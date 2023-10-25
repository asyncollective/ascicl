BOOTSTRAP = ./docs/assets/css/ascicl.css
BOOTSTRAP_LESS = ./less/bootstrap.less
BOOTSTRAP_RESPONSIVE = ./docs/assets/css/ascicl-responsive.css
BOOTSTRAP_RESPONSIVE_LESS = ./less/responsive.less
DATE=$(shell date +%I:%M%p)
CHECK=\033[32m✔\033[39m
HR=\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#


#
# BUILD DOCS
#

build:
	@echo "\n${HR}"
	@echo "Building ASCICL..."
	@echo "${HR}\n"
	@./node_modules/.bin/jshint js/*.js --config js/.jshintrc
	@./node_modules/.bin/jshint js/tests/unit/*.js --config js/.jshintrc
	@echo "Running JSHint on javascript...             ${CHECK} Done"
	@./node_modules/.bin/lessc ${BOOTSTRAP_LESS} > ${BOOTSTRAP}
	@./node_modules/.bin/lessc ${BOOTSTRAP_RESPONSIVE_LESS} > ${BOOTSTRAP_RESPONSIVE}
	@echo "Compiling LESS with lessc...               ${CHECK} Done"
	@node docs/build
	@cp img/* docs/assets/img/
	@cp js/*.js docs/assets/js/
	@cp js/tests/vendor/jquery.js docs/assets/js/
	@echo "Compiling documentation...                  ${CHECK} Done"
	@cat js/bootstrap-transition.js js/bootstrap-alert.js js/bootstrap-button.js js/bootstrap-carousel.js js/bootstrap-collapse.js js/bootstrap-dropdown.js js/bootstrap-modal.js js/bootstrap-tooltip.js js/bootstrap-popover.js js/bootstrap-scrollspy.js js/bootstrap-tab.js js/bootstrap-typeahead.js js/bootstrap-affix.js > docs/assets/js/ascicl.js
	@./node_modules/.bin/uglifyjs -nc docs/assets/js/ascicl.js > docs/assets/js/ascicl.min.tmp.js
	@echo "/**\n* Bootstrap.js v2.3.2 by @fat & @mdo\n* Copyright 2013 Twitter, Inc.\n* http://www.apache.org/licenses/LICENSE-2.0.txt\n*/" > docs/assets/js/copyright.js
	@echo "/**\n* ascicl.js v3.0.0 by nulcow from the asyncollective */" > docs/assets/js/copyright.js
	@cat docs/assets/js/copyright.js docs/assets/js/ascicl.min.tmp.js > docs/assets/js/ascicl.min.js
	@rm docs/assets/js/copyright.js docs/assets/js/ascicl.min.tmp.js
	@echo "Compiling and minifying javascript...       ${CHECK} Done"
	@echo "\n${HR}"
	@echo "ascicl successfully built at ${DATE}."
	@echo "${HR}\n"
	@echo "Thanks for using ASCICL!"
	@echo "ascicl built by nulcow, based on Twitter Bootstrap 2.3.2 by @mdo and @fat."

#
# RUN JSHINT & QUNIT TESTS IN PHANTOMJS
#

test:
	./node_modules/.bin/jshint js/*.js --config js/.jshintrc
	./node_modules/.bin/jshint js/tests/unit/*.js --config js/.jshintrc
	node js/tests/server.js &
	phantomjs js/tests/phantom.js "http://localhost:3000/js/tests"
	kill -9 `cat js/tests/pid.txt`
	rm js/tests/pid.txt

#
# CLEANS THE ROOT DIRECTORY OF PRIOR BUILDS
#

clean:
	rm -r dist

#
# BUILD SIMPLE BOOTSTRAP DIRECTORY
# recess & uglifyjs are required
#

ascicl: bootstrap-img bootstrap-css bootstrap-js

#
# JS COMPILE
#
bootstrap-js: dist/js/*.js

dist/js/*.js: js/*.js
	mkdir -p dist/js
	cat js/bootstrap-transition.js js/bootstrap-alert.js js/bootstrap-button.js js/bootstrap-carousel.js js/bootstrap-collapse.js js/bootstrap-dropdown.js js/bootstrap-modal.js js/bootstrap-tooltip.js js/bootstrap-popover.js js/bootstrap-scrollspy.js js/bootstrap-tab.js js/bootstrap-typeahead.js js/bootstrap-affix.js > dist/js/ascicl.js
	./node_modules/.bin/uglifyjs -nc dist/js/ascicl.js > dist/js/ascicl.min.tmp.js
	echo "/*!\n* Bootstrap.js by @fat & @mdo\n* Copyright 2013 Twitter, Inc.\n* http://www.apache.org/licenses/LICENSE-2.0.txt\n*/" > dist/js/copyright.js
	cat dist/js/copyright.js dist/js/ascicl.min.tmp.js > dist/js/ascicl.min.js
	rm dist/js/copyright.js dist/js/ascicl.min.tmp.js

#
# CSS COMPLILE
#

bootstrap-css: dist/css/*.css

dist/css/*.css: less/*.less
	mkdir -p dist/css
	./node_modules/.bin/lessc ${BOOTSTRAP_LESS} > dist/css/ascicl.css
	./node_modules/.bin/recess --compress ${BOOTSTRAP_LESS} > dist/css/ascicl.min.css
	./node_modules/.bin/lessc ${BOOTSTRAP_RESPONSIVE_LESS} > dist/css/ascicl-responsive.css
	./node_modules/.bin/recess --compress ${BOOTSTRAP_RESPONSIVE_LESS} > dist/css/ascicl-responsive.min.css

#
# IMAGES
#

bootstrap-img: dist/img/*

dist/img/*: img/*
	mkdir -p dist/img
	cp img/* dist/img/

#
# WATCH LESS FILES
#

watch:
	echo "Watching less files..."; \
	watchr -e "watch('less/.*\.less') { system 'make' }"


.PHONY: docs watch gh-pages bootstrap-img bootstrap-css bootstrap-js