#!/bin/bash

domains=()
for entry in $DOMAINS
do
    domains+="-d $entry "
done

certbot --manual \
    --text \
    --keep-until-expiring \
    --email $DOMAIN_EMAIL \
    --noninteractive \
    --agree-tos \
    --expand \
    --preferred-challenges dns \
    --manual-auth-hook /hook.sh \
    --manual-cleanup-hook /hook.sh \
    --manual-public-ip-logging-ok \
    ${domains[@]} \
    certonly
