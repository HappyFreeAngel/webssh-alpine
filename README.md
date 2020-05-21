#https://pypi.org/project/webssh/
# 运行方法:
#docker stop webssh;docker rm webssh; docker run -d --privileged --name webssh -p 80:80 webssh-1.0.3:alpine-3.9
#打开浏览器 http://localhost:80




#如果是arm架构的处理器:
pi@pi4b:/var/server/docker-app/webssh $ more start-docker.sh
#!/usr/bin/env bash

docker stop webssh docker rm webssh

docker run --name webssh \
-d \
-p 1080:80 \
--restart=always \
ascs/webssh:arm32v7
