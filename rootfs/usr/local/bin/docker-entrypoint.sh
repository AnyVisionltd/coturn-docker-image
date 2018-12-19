#!/bin/sh

# If command starts with an option, prepend with turnserver binary.
if [ "${1:0:1}" == '-' ]; then
  set -- turnserver --external-ip="${EXTERNAL_IP:-$(hostname -i)}" "$@"
fi

exec $(eval "echo $@")
