
ADMIN_USER = admin
ADMIN_PASS = mirr0r
COUCH_HOST = 0.0.0.0
COUCH_PORT = 1877

default: start

start:
	couchdb -a couch.ini

clean:
	git clean -xdf

admin:
	curl -X PUT http://$(COUCH_HOST):$(COUCH_PORT)/_config/admins/$(ADMIN_USER) -d '"$(ADMIN_PASS)"'

registry:
	curl -X PUT http://$(ADMIN_USER):$(ADMIN_PASS)@$(COUCH_HOST):$(COUCH_PORT)/registry

.PHONY: clean start default admin registry


