# weewx-docker

## Run with 

docker run -dit \
  -v /hass/weewx/etc/weewx/:/etc/weewx/ \
  -v /hass/weewx/usr/share/weewx/user/:/usr/share/weewx/user/ \
  -v /hass/weewx/html/weewx/:/var/www/html/weewx/ \
  -v /hass/weewx/var/lib/weewx/:/var/lib/weewx/ \
  -v /hass/weewx/extensions:/extensions \
  --name=weewx \
  pcoiner/weewx-docker


