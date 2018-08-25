#!/bin/sh
set -e

consul-template -once \
  -template="/etc/nginx/conf.d/tpl/sync.conf:/etc/nginx/conf.d/sync.conf" \
  -template="/etc/nginx/conf.d/tpl/registry.conf:/etc/nginx/conf.d/registry.conf" \
  -template="/etc/nginx/conf.d/tpl/nexus.conf:/etc/nginx/conf.d/nexus.conf" \
  -template="/etc/nginx/conf.d/tpl/registry.htpasswd:/etc/nginx/conf.d/registry.htpasswd" \
  -template="/etc/nginx/conf.d/tpl/status.conf:/etc/nginx/conf.d/status.conf" \
  -template="/etc/nginx/conf.d/tpl/ghost.conf:/etc/nginx/conf.d/ghost.conf"

exec "$@"
