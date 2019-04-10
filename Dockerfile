FROM python:3.7.3-alpine3.9
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache --virtual .build-deps binutils-gold curl g++ gcc gnupg libgcc linux-headers make libffi-dev openssl-dev \
        && rm -rf /var/cache/apk/*

RUN pip3 install webssh -i https://pypi.tuna.tsinghua.edu.cn/simple

RUN apk del .build-deps
EXPOSE 80/tcp 22/tcp 443/tcp 8000/tcp

ENTRYPOINT  ["wssh", "--port=80", "FOREGROUND"]

## start a http server with specified listen address and listen port
#wssh --address='2.2.2.2' --port=8000
#
## start a https server, certfile and keyfile must be passed
#wssh --certfile='/path/to/cert.crt' --keyfile='/path/to/cert.key'
#
## missing host key policy
#wssh --policy=reject
#
## logging level
#wssh --logging=debug
#
## log to file
#wssh --log-file-prefix=main.log
#
## more options
#wssh --help
