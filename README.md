Use 

tls certificates must be placed in /acme directory

```
rancher-traefik:
  ports:
  - 9980:9980/tcp
  environment:
    CONFD_INTERVAL=30
  labels:
    io.rancher.container.pull_image: always
    #io.rancher.scheduler.global: 'true'
  tty: true
  image: jmcarbo/rancher-traefik:latest
  stdin_open: true
```

Example docker-compose.yml
```
whoami:
  labels:
    io.rancher.container.pull_image: always
  image: jwilder/whoami
  stdin_open: true
rufus:
  labels:
    io.rancher.container.pull_image: always
  image: rufus/isawesome
  stdin_open: true
owncloud:
  image: owncloud:9.0
drupal:
  image: drupal
gollum:
  image: suttang/gollum
minio:
  image: minio/minio
  environment:
    MINIO_ACCESS_KEY: DG26A9NNR0K99SEIDVWH 
    MINIO_SECRET_KEY: ZWs71joah1c3ZR68TjmYatlWjeeb3Nn3th1RNCb1 
  volumes:
    - exportminio:/export
    - minioconf:/root/.minio
syno7:
  image: rancher/external-service

rancher-traefik:
  ports:
  - 80:80/tcp
  - 443:443/tcp
  labels:
    io.rancher.container.pull_image: always
    io.rancher.container.create_agent: "true"
    io.rancher.container.agent.role: "environment"
    traefik.entrypoints.http.address: :80
    traefik.entrypoints.https.address: :443
    traefik.certificates: "a1.localcluster.joanmarc.cat,a1.localcluster.imim.cloud,joanmarc2.cat"
    #io.rancher.scheduler.global: 'true'
  tty: true
  image: jmcarbo/rancher-traefik:latest
  stdin_open: true
  environment:
    MINIO_URL: http://minio:9000
    MINIO_BUCKET: certificates
    MINIO_ACCESS_KEY: DG26A9NNR0K99SEIDVWH 
    MINIO_SECRET_KEY: ZWs71joah1c3ZR68TjmYatlWjeeb3Nn3th1RNCb1 
    RANCHER_URL: http://192.168.99.100:8080/
    RANCHER_ACCESS_KEY: FAC0083B0208E2E2B5F4
    RANCHER_SECRET_KEY: xSjJFoSbUeDPFb9ELQ5okPD6EoQ3Gki9yAvziVbL
    RANCHER_IP: 192.168.99.100
  volumes:
    - acme:/acme
  #command: /bin/bash
```

Example rancher-compose.yml

```

whoami:
  scale: 1
  metadata:
    traefik.backend: whoami
    traefik.frontend.rule: Host
    traefik.frontend.value: "whoami.${RANCHER_IP}.xip.io,whoamijmca.ngrok.io"
    traefik.port: '8000'
    traefik.enable: 'true'
syno7:
  external_ips:
  - 192.168.2.7
  metadata:
    traefik.backend: syno7
    traefik.frontend.rule: Host
    traefik.frontend.value: "syno7.ngrok.io"
    traefik.port: '5000'
    traefik.enable: 'true'
rufus:
  scale: 1
  metadata:
    traefik.backend: rufus
    traefik.frontend.rule: Host
    traefik.frontend.value: "rufus.${RANCHER_IP}.xip.io,rufusjmca.ngrok.io"
    traefik.port: '80'
    traefik.enable: 'true'
owncloud:
  scale: 1
  metadata:
    traefik.backend: owncloud
    traefik.frontend.rule: Host
    traefik.frontend.value: "owncloud.${RANCHER_IP}.xip.io,owncloudjmca.ngrok.io"
    traefik.port: '80'
    traefik.enable: 'true'
drupal:
  scale: 1
  metadata:
    traefik.backend: drupal
    traefik.frontend.rule: Host
    traefik.frontend.value: "drupal.${RANCHER_IP}.xip.io,drupaljmca.ngrok.io"
    traefik.port: '80'
    traefik.enable: 'true'
gollum:
  scale: 1
  metadata:
    traefik.backend: gollum
    traefik.frontend.rule: Host
    traefik.frontend.value: "a1.localcluster.imim.cloud,gollumjmca.ngrok.io"
    traefik.port: '4567'
    traefik.enable: 'true'
    traefik.certificates: "marbiobanc.imim.cloud"
minio:
  scale: 1
  metadata:
    traefik.backend: minio
    traefik.frontend.rule: Host
    traefik.frontend.value: "minio.localcluster.joanmarc.cat,miniojmca.ngrok.io"
    traefik.port: '9000'
    traefik.enable: 'true'
    traefik.certificates: "minio.imim.cloud,miniointern.imim.cloud"

rancher-traefik:
  scale: 1
  metadata:
    traefik.backend: traefik
    traefik.frontend.rule: Host
    traefik.frontend.value: "traefik.ngrok.io"
    traefik.port: '8080'
    traefik.enable: 'true'
```


