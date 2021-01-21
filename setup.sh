#!/bin/bash

echo "
    # Place your dedyn.io access token here:
    DEDYN_TOKEN=$DEDYN_TOKEN
    
    # Set your dedyn.io domain name here:
    DEDYN_NAME=$DEDYN_NAME" > /.dedynauth
    
./run/get_renew_cert.sh
./usr/sbin/crond -f -L /dev/stderr
