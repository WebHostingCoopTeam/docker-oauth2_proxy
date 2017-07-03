FROM golang:1.9-alpine

MAINTAINER Josh Cox "https://github.com/WebHostingCoopTeam/docker-oauth2_proxy/issues"

RUN apk update && apk upgrade && \
apk add git && \
rm -rf /var/cache/apk/*

RUN git clone --branch v2.1 https://github.com/bitly/oauth2_proxy.git /go/src/app \
&& go get -d -v github.com/bitly/oauth2_proxy \
&& go install -v github.com/bitly/oauth2_proxy

VOLUME /conf

EXPOSE 4180

CMD ["oauth2_proxy", "-config", "/conf/oauth2_proxy.cfg"]
