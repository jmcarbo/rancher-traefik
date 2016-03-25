Use 
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
