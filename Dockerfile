# image sandinh/ohze-nginx
FROM nginx:1.15-alpine

ARG CONSUL_TEMPLATE_VERSION=0.19.5

RUN apk add --no-cache wget && \
    wget --no-check-certificate -qO /tmp/consul-template.tgz \
        https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tgz && \
    tar -xzf /tmp/consul-template.tgz -C /usr/bin && \
    rm /tmp/consul-template.tgz

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
    PROXY_STATUS=''

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
