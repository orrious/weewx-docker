# weewx-docker

## docker run 
```
docker run -dit \
  -v /hass/weewx/etc/weewx/:/etc/weewx/ \
  -v /hass/weewx/usr/share/weewx/user/:/usr/share/weewx/user/ \
  -v /hass/weewx/html/weewx/:/var/www/html/weewx/ \
  -v /hass/weewx/var/lib/weewx/:/var/lib/weewx/ \
  -v /hass/weewx/extensions:/extensions \
  --name=weewx \
  pcoiner/weewx-docker
```

## docker-compose.yml
```
  weewx:
    container_name: weewx
    image: pcoiner/weewx-docker:latest
    volumes:
      - ./weewx/etc/weewx/:/etc/weewx/
      - ./weewx/usr/share/weewx/user/:/usr/share/weewx/user
      - ./weewx/html/weewx/:/var/www/html/weewx/
      - ./weewx/var/lib/weewx/:/var/lib/weewx/
      - ./weewx/extensions:/extensions
    restart: always
    stdin_open: true
    tty: true
```

