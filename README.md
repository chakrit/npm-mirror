
# NPM-MIRROR

(Almost) all the stuff you need to start running an npm mirror locally on your machine.

Just follow these steps:

1. Install the tools. We're gonna need these (which hopefully you have already got them):

   * node
   * npm
   * make
   * couchdb

2. Clone the repository

```sh
$ git clone git://github.com/chakrit/npm-mirror.git path/you/want/for/mirror
$ cd path/you/want/for/mirror
```

3. Edits `Makefile` and change the variables to your liking.

```sh
$ cd path/you/want/for/mirror
$ nano Makefile
```

Example of what's provided by default:

```make
ADMIN_USER = admin      # local couchdb admin username
ADMIN_PASS = mirr0r     # password
COUCH_HOST = 0.0.0.0    # where you are actually running the couchdb instance
COUCH_PORT = 1877       # couchdb port

NPMORG_HOST = isaacs.iriscouch.com    # source npm registry to clone from
NPMORG_PORT = 80                      # port
```

3. Runs `make` to starts up a CouchDb instance.

```sh
$ cd path/you/want/for/mirror
$ make
# CouchDb should have been started running in your terminal window.
```

4. Runs `make setup` to setup the CouchDb instance.

```sh
$ make setup
```

5. Runs `make repliacte` to starts the replicating the configured npm registry to your machine.

```sh
$ make replicate
```

6. Gives `npm` the `--registry` flag pointing to your local CouchDb install whenever you want to install
   or publish packages to/from this repository.

```sh
$ npm --registry http://localhost:1877/registry/_design/app/_rewrite install yourpackage
```

That's it!

