#!/bin/sh

if [ ! -f /conf/oauth2_proxy.cfg ]
  then
    oauth2_proxy -config /conf/oauth2_proxy.cfg -upstream $UPSTREAM $OATH2_PROXY_ARGS
else
    oauth2_proxy -upstream $UPSTREAM $OATH2_PROXY_ARGS
fi
