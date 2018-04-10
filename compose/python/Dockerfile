FROM alpine:3.7
ENV PYTHONUNBUFFERED 1

RUN echo 'http://mirrors.aliyun.com/alpine/v3.7/main/' > /etc/apk/repositories
RUN echo 'http://mirrors.aliyun.com/alpine/v3.7/community/' >> /etc/apk/repositories
RUN apk add --update supervisor py3-lxml libevent py3-pillow py3-psycopg2 python3-dev python3 py3-gevent py-pip
RUN apk add libffi-dev py3-cffi py3-crypto py3-gunicorn py3-gevent

RUN cd /usr/bin \
	&& ln -s idle3 idle \
	&& ln -s pydoc3 pydoc \
	&& ln -s python3 python \
	&& ln -s python3-config python-config