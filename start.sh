#!/bin/bash

if test -f "/extensions/packages.conf"; then
  apt-get update 
  apt-get install -y $(sed '/^#/ d' /extensions/packages.conf | sed ':a;N;$!ba;s/\n/ /g')
  apt-get clean
fi

if test ! -f "/usr/share/weewx/user/__init__.py"; then
  cp -rp /usr/share/weewx/.user.example/* /usr/share/weewx/user 
fi

if test ! -f "/etc/weewx/weewx.conf" ; then 
  while true; do
    printf "\rYou haven't configured weewx yet.  Would you like to now? (Y/N)"
    read -t 0.25 -N 1 input
    if [[ $input = "y" ]] || [[ $input = "Y" ]]; then
        echo
        break 
    fi
  done
  cp -rp /etc/.weewx.example/* /etc/weewx 
  /usr/bin/wee_config --reconfigure /etc/weewx/weewx.conf
fi

/usr/bin/weewxd ${WEEWX_CFG:=/etc/weewx/weewx.conf} --pidfile=/var/run/weewx.pid

