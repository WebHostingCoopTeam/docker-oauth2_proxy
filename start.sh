#!/bin/sh

which oauth2_proxy
export OAUTH2_PROXY=$(which oauth2_proxy)

# if unset or null make it '*'
EMAIL_DOMAIN="${EMAIL_DOMAIN:-'*'}"

export OATH_CMDLINE="-upstream $UPSTREAM email-domain=$EMAIL_DOMAIN $OATH2_PROXY_ARGS"

if [ -f /conf/oauth2_proxy.cfg ]
  then
    export OATH_CMDLINE="-config /conf/oauth2_proxy.cfg $OATH_CMDLINE"
fi

echo "$(OAUTH2_PROXY) $(OAUTH_CMDLINE)"
echo 'starting .....'
$OAUTH2_PROXY $OAUTH_CMDLINE
