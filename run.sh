#!/bin/bash

set -m
CONFIG_FILE="/config/telegraf.conf"

if [ "${INFLUXDB_HOST}" == "**None**" ]; then
  unset INFLUXDB_HOST
fi

if [ -n "${INFLUXDB_HOST}" ]; then
  sed -i -u "s#urls = .*#urls = [\"http://${INFLUXDB_HOST}:8086\"]#g" ${CONFIG_FILE}
fi

echo "=> Starting Telegraf ..."
exec telegraf -config ${CONFIG_FILE}