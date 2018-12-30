#!/bin/sh

if [ -z "${EXTERNAL_IP}" ]; then
  EXTERNAL_IP="$(ip route get $(ip route show 0.0.0.0/0 | grep -oP 'via \K\S+') | grep -oP 'src \K\S+')"
fi

exec turnserver --external-ip ${EXTERNAL_IP} ${COTURN_CMD}
