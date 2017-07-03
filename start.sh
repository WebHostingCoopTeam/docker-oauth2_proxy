#!/bin/sh

# if unset or null make it '*'
EMAIL_DOMAIN="${EMAIL_DOMAIN:-'*'}"

export OAUTH2_CMDLINE="-upstream $UPSTREAM email-domain=$EMAIL_DOMAIN $OATH2_PROXY_ARGS"

if [ -f /conf/oauth2_proxy.cfg ]
  then
    export OAUTH2_CMDLINE="-config /conf/oauth2_proxy.cfg $OAUTH2_CMDLINE"
fi

export OAUTH2_CMDLINE="oauth2_proxy $OAUTH2_CMDLINE"
echo "cmdline is $OAUTH2_CMDLINE"
echo 'starting .....'

$OAUTH2_CMDLINE
