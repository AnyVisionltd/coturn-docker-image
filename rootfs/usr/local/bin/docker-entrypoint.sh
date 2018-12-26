#!/bin/sh
set -eu

DESTINATION_IP="$(dig ${WEBRTC_HOST:-webrtc.tls.ai} +short)"
ROUTE_IP="$(ip route get ${DESTINATION_IP} | awk '{print $NF;exit}')"
IP="${EXTERNAL_IP:-$ROUTE_IP}"

# If command starts with an option, prepend with turnserver binary.
if [ "${1:0:1}" == '-' ]; then
  set -- turnserver --listening-ip=$IP --relay-ip=$IP --external-ip=$IP "$@"
fi

exec $(eval "echo $@")
