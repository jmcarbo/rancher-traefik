#!/bin/bash
echo Getting certificates 
certs=$(curl -s http://rancher-metadata/latest/self/container/labels/traefik.certificates)
IFS=',' read -ra ADDR <<< "$certs"
for i in ${ADDR[@]}; do
  echo "Getting $i"
  curl -s -u "$RANCHER_ACCESS_KEY:$RANCHER_SECRET_KEY" http://192.168.99.100:8080/v1/projects/1a5/certificates| jq -r '.data[] | select(.name | . and contains("'"$i"'")) | .cert'
done
