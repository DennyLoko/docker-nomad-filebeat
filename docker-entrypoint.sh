#!/usr/bin/dumb-init /bin/sh
set -e

for VAR in $(env | grep ^NOMAD_META_ | cut -d= -f1);do
  if [ -n "$META" ]; then
    META="${META},${VAR}"
  else
    META="${VAR}"
  fi
done

sigil -f /etc/filebeat.yml.tmpl meta=$META > /etc/filebeat.yml

exec "$@"