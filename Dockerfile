FROM alpine:3.5
MAINTAINER Shane <ccniubi@163.com>

WORKDIR /data/mysql
ENV DATA_DIR /data/mysql
VOLUME /data/mysql
COPY startup.sh /startup.sh

RUN  sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
     apk update && \
     apk add tzdata && \
     ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
     echo "Asia/Shanghai" > /etc/timezone

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*
COPY my.cnf /etc/mysql/my.cnf

EXPOSE 3306
CMD ["/startup.sh"]
