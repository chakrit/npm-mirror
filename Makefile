
# REF: https://blog.caurea.org/2012/01/31/local-npm-registry-mirror.html

BIN = ./node_modules/.bin

ADMIN_USER = admin
ADMIN_PASS = mirr0r
COUCH_HOST = 0.0.0.0
COUCH_PORT = 1877

NPMORG_HOST = isaacs.iriscouch.com
NPMORG_PORT = 80


default: start

install:
	npm install

start:
	couchdb -a couch.ini

clean:
	git clean -xdf

admin:
	curl -X PUT http://$(COUCH_HOST):$(COUCH_PORT)/_config/admins/$(ADMIN_USER) -d '"$(ADMIN_PASS)"'

registry:
	curl -X PUT http://$(ADMIN_USER):$(ADMIN_PASS)@$(COUCH_HOST):$(COUCH_PORT)/registry

replicate:
	replicate http://$(NPMORG_HOST):$(NPMORG_PORT)/registry \
		http://$(COUCH_HOST):$(COUCH_PORT)/registry

.PHONY: clean start default admin registry replicate


