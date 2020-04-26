# weewx-docker
I created this to make it easy to deploy weewx and keep it up to date.  We need to mount and keep local the directories where our persistent data will reside.

Within the docker container we follow the standard weewx directories as when installed via a package
```
/etc/weewx                   
/usr/share/weewx/user      
/var/www/html/weewx        
/var/lib/weewx             
/extensions                 #added directory to store weewx extensions
/extensions/packages.conf   #list required ubuntu packages needed for your extensions.
```

When the container first starts, it will ```apt update && apt update && apt -y install [/extensions/packages.conf``` 

## docker run 
```
docker run -dit \
  -v /docker/weewx/etc/weewx/:/etc/weewx/ \
  -v /docker/weewx/usr/share/weewx/user/:/usr/share/weewx/user/ \
  -v /docker/weewx/html/weewx/:/var/www/html/weewx/ \
  -v /docker/weewx/var/lib/weewx/:/var/lib/weewx/ \
  -v /docker/weewx/extensions:/extensions \
  --name=weewx \
  pcoiner/weewx-docker
```

If this is the first time running the container  [/etc/weewx.conf doesn't exist] then attach to the container and setup weewx.
```docker attach weewx```

If you have an existing /etc/weewx.conf then weewx will try to start.

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

