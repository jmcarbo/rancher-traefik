#!/bin/bash
confd -onetime -backend rancher
traefik -c /etc/traefik.toml &
confd -backend rancher
