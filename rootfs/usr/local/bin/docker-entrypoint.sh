#!/bin/sh

# If command starts with an option, prepend with turnserver binary.
if [ "${1:0:1}" == '-' ]; then
  set -- turnserver --listening-ip="${EXTERNAL_IP:-$(ip route get 1 | awk '{print $NF;exit}')}" --external-ip="${EXTERNAL_IP:-$(ip route get 1 | awk '{print $NF;exit}')}" "$@"
fi

exec $(eval "echo $@")
