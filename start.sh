#!/bin/bash
export GODEBUG=netdns=cgo
sleep 10
gosuv add --name "confd" -- /usr/local/bin/confd -backend rancher -interval ${CONFD_INTERVAL:-15}
gosuv add --name "traefik" -- /usr/local/bin/traefik -c /etc/traefik.toml
