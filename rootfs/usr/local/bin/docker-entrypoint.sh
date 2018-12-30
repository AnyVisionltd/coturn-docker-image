#!/bin/sh

if [ -z "${EXTERNAL_IP}" ]; then
  if [ "${DETECT_PUBLIC_IP}" = true ]; then
    EXTERNAL_IP="$(detect-external-ip.sh)"
  else
    DESTINATION_IP="$(dig ${WEBRTC_HOST:-webrtc.tls.ai} +short)"
    EXTERNAL_IP="$(ip route get ${DESTINATION_IP} | awk '{print $NF;exit}')"
  fi
fi

exec turnserver --external-ip ${EXTERNAL_IP} ${COTURN_CMD}
