#!/bin/sh

# if unset or null make it '*'
EMAIL_DOMAIN="${EMAIL_DOMAIN:-'*'}"

export OAUTH_CMDLINE="-upstream $UPSTREAM email-domain=$EMAIL_DOMAIN $OATH2_PROXY_ARGS"

if [ -f /conf/oauth2_proxy.cfg ]
  then
    export OATH_CMDLINE="-config /conf/oauth2_proxy.cfg $OATH_CMDLINE"
fi

echo "cmdline is $OAUTH_CMDLINE"
echo 'starting .....'

oauth2_proxy $OAUTH_CMDLINE
