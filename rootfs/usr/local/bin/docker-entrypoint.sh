#!/bin/sh

IP="${EXTERNAL_IP:-$(ip route get 1 | awk '{print $NF;exit}')}"

# If command starts with an option, prepend with turnserver binary.
if [ "${1:0:1}" == '-' ]; then
  set -- turnserver --listening-ip=$IP --relay-ip=$IP --external-ip=$IP "$@"
fi

exec $(eval "echo $@")
