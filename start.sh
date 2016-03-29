#!/bin/bash
export GODEBUG=netdns=cgo
confd -onetime -backend rancher
<<<<<<< HEAD
gosuv add --name "traefik" -- /usr/local/bin/traefik -c /etc/traefik.toml
confd -backend rancher
=======
traefik -c /etc/traefik.toml &
confd -backend rancher -interval ${CONFD_INTERVAL:-15}
>>>>>>> 077124a85aebbe8b4511f1b99bf08f964996fad4
