FROM golang:1.9-alpine

MAINTAINER Josh Cox "https://github.com/WebHostingCoopTeam/docker-oauth2_proxy/issues"

RUN git clone --branch v2.2 https://github.com/bitly/oauth2_proxy.git /go/src/app

RUN go get -d -v github.com/bitly/oauth2_proxy
RUN go install -v github.com/bitly/oauth2_proxy

VOLUME /conf

EXPOSE 4180

CMD ["oauth2_proxy", "-config", "/conf/oauth2_proxy.cfg"]
