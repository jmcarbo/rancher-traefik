#!/bin/bash
export GODEBUG=netdns=cgo
confd -onetime -backend rancher
gosuv add --name "traefik" -- /usr/local/bin/traefik -c /etc/traefik.toml
confd -backend rancher -interval ${CONFD_INTERVAL:-15}
