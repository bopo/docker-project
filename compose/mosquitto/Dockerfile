FROM alpine:3.7

MAINTAINER Bopo Wang <ibopo@126.com>

# Build-time metadata as defined at http://label-schema.org
ENV LANG C.UTF-8

RUN echo 'http://mirrors.aliyun.com/alpine/v3.7/main/' > /etc/apk/repositories
RUN echo 'http://mirrors.aliyun.com/alpine/v3.7/community/' >> /etc/apk/repositories

RUN apk add --no-cache ca-certificates mosquitto curl-dev openssl-dev mosquitto-dev openssl bash
# make auth-plugin
RUN apk add --no-cache --virtual .build-deps g++ automake autoconf make git 

RUN mkdir -p /build
RUN mkdir -p /etc/mosquitto/conf.d/
RUN mkdir -p /usr/lib/mosquitto-auth-plugin/

RUN git clone http://git.eclipse.org/gitroot/mosquitto/org.eclipse.mosquitto.git /build/org.eclipse.mosquitto
RUN git clone https://github.com/jpmens/mosquitto-auth-plug.git /build/mosquitto-auth-plug

COPY script/auth_plugin.conf /etc/mosquitto/conf.d/auth_plugin.conf
COPY script/config.mk /build/mosquitto-auth-plug/config.mk
RUN make -C /build/mosquitto-auth-plug

RUN cp /build/mosquitto-auth-plug/auth-plug.so /usr/lib/mosquitto-auth-plugin/
RUN rm -rf /etc/ssl/openssl.cnf
RUN wget http://web.mit.edu/crypto/openssl.cnf -P /etc/ssl

# RUN apk del .fetch-deps
RUN apk del .build-deps
RUN rm -fr /build

# RUN mkdir -p /mqtt/config /mqtt/data /mqtt/log
COPY config /etc/mosquitto
RUN chown -R mosquitto:mosquitto /etc/mosquitto
RUN chown -R mosquitto:mosquitto /var/log

VOLUME ["/etc/mosquitto", "/var/lib/mosquitto", "/var/log", "/certs"]

EXPOSE 1883 9001 8883

ADD docker-entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/etc/mosquitto/mosquitto.conf"]
