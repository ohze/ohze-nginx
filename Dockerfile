# image sandinh/ohze-nginx
FROM nginx:1.21.1-alpine

ARG CONSUL_TEMPLATE_VERSION=0.27.0

RUN \
    wget --no-check-certificate -qO /tmp/consul-template.zip \
        https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    unzip /tmp/consul-template.zip -d /usr/bin/ && \
    rm /tmp/consul-template.zip && \
    mkdir /etc/nginx/conf.d/certbot && \
    wget -P /etc/nginx/conf.d/certbot \
      https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf

COPY rootfs /

ENV VHOST_SYNC='' \
    PROXY_SYNC='' \
    VHOST_NEXUS='' \
    PROXY_NEXUS='' \
    VHOST_REGISTRY='' \
    PROXY_REGISTRY='' \
    REGISTRY_USER='' \
    REGISTRY_PW='' \
    VHOST_STATUS='' \
    PROXY_STATUS='' \
    VHOST_GHOST='' \
    GHOST_IMAGES_DIR='' \
    PROXY_GHOST=''

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
