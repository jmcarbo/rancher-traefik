FROM ubuntu
RUN apt-get update && apt-get install -y curl wget
ADD https://github.com/containous/traefik/releases/download/v1.0.0-beta.280/traefik_linux-amd64 /usr/local/bin/traefik
RUN chmod +x /usr/local/bin/traefik
ADD https://github.com/kelseyhightower/confd/releases/download/v0.12.0-alpha3/confd-0.12.0-alpha3-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd
