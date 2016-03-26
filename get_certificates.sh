#!/bin/bash
echo Getting certificates 
certs=$(curl -s http://rancher-metadata/latest/self/container/labels/traefik.certificates)
IFS=',' read -ra ADDR <<< "$certs"
for i in ${ADDR[@]}; do
  echo "Getting $i"
done
