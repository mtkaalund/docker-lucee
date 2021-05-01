# docker-lucee

First make sure that you have a docker and docker compose working.

## Changing the root path
This a simple `docker-compose` file for setting up a [lucee](http://lucee.org) docker [image](https://hub.docker.com/r/lucee/lucee5).

First edit the `.env` file and change to `ROOT` to where ever your installation is going to be,
just be sure that your user have read/write access to the `ROOT` path.

Contents of `.env`:
```
# The directory where data and configuration will be stored.
ROOT=/media
```

## Checking the docker-compose.yml

So the contents of the `docker-compose.yml` is as follows:
```
version: "3.7"
services:
  lucee:
     container_name: lucee
     image: lucee/lucee5-nginx:latest
     network_mode: bridge
     ports:
             - 80:80
             - 8888:8888
             - 443:443
     volumes:
             #              - ${ROOT}/tomcat-cfg:/usr/local/tomcat/conf
             #              - ${ROOT}/supervisor-cfg:/etc/supervisor
             #              - ${ROOT}/nginx-cfg:/etc/nginx
             - ${ROOT}/logs:/usr/local/tomcat/logs
             - ${ROOT}/logs:/opt/lucee/web/logs
             - ${ROOT}/logs:/var/log
             - ${ROOT}/lucee-cfg:/opt/lucee/web
             - ${ROOT}/context:/opt/lucee/server/lucee-server/context
             - ${ROOT}/www:/var/www

```

Right now it is in bridge network mode, you can change that to another network mode even get it to use a vpn. I have not done this because this just a local web server for experimenting.

Next this configuration has expose ports 80, 8888 and 443 these can be change and even ported to another port. 
```
            - docker_port:computer_port
```

