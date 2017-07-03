FROM golang:1.9-alpine

MAINTAINER Josh Cox "https://github.com/WebHostingCoopTeam/docker-oauth2_proxy/issues"

ENV OAUTH2_PROXY_UPDATE 20170702

RUN apk update && apk upgrade && \
apk add git && \
rm -rf /var/cache/apk/*

RUN git clone --branch master https://github.com/bitly/oauth2_proxy.git /go/src/app \
&& go get -d -v github.com/bitly/oauth2_proxy \
&& go install -v github.com/bitly/oauth2_proxy

VOLUME /conf

EXPOSE 4180

CMD ["oauth2_proxy", "-config", "/conf/oauth2_proxy.cfg"]
