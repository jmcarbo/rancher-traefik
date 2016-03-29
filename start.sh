#!/bin/bash
confd -onetime -backend rancher
gosuv add --name "traefik" -- /usr/local/bin/traefik -c /etc/traefik.toml
confd -backend rancher
