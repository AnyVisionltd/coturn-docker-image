#!/bin/sh

if [ -z "${EXTERNAL_IP}" ]; then
  EXTERNAL_IP=$(ip route get $(ip route show 0.0.0.0/0|grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")|awk '{for(i=1;i<=NF;i++) if ($i=="src") print $(i+1)}')
fi

exec turnserver --external-ip ${EXTERNAL_IP} ${COTURN_CMD}
