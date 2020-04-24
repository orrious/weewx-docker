#!/bin/sh

[ ! -f "/etc/weewx/weewx.conf" ] \
  && cp -rp /etc/sample.weewx/* /etc/weewx \
  && /usr/bin/wee_config --reconfigure /etc/weewx/weewx.conf

/usr/bin/weewxd ${WEEWX_CFG:=/etc/weewx/weewx.conf} --pidfile=/var/run/weewx.pid

