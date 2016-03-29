FROM ubuntu
RUN apt-get update && apt-get install -y curl wget vim jq
ADD https://github.com/containous/traefik/releases/download/v1.0.0-beta.280/traefik_linux-amd64 /usr/local/bin/traefik
RUN chmod +x /usr/local/bin/traefik
ADD https://github.com/kelseyhightower/confd/releases/download/v0.12.0-alpha3/confd-0.12.0-alpha3-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd
RUN bash -c 'mkdir -p /etc/confd/{conf.d,templates}'
ADD confd.toml /etc/confd/conf.d/confd.toml
ADD traefik.toml.tmpl /etc/confd/templates/traefik.toml.tmpl
ADD certificates.sh.tmpl /etc/confd/templates/certificates.sh.tmpl
ADD start.sh /start.sh
RUN chmod +x /start.sh
ADD gosuv /usr/local/bin/gosuv
RUN chmod +x /usr/local/bin/gosuv
ADD get_certificates.sh /usr/local/bin/get_certificates.sh
RUN chmod +x /usr/local/bin/get_certificates.sh
ADD dummy.crt /etc/certs/dummy.crt
ADD dummy.key /etc/certs/dummy.key
ADD https://dl.minio.io/client/mc/release/linux-amd64/mc /usr/local/bin/mc
RUN chmod +x /usr/local/bin/mc
CMD "/start.sh"
VOLUME "/acme"


