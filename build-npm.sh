#!/bin/sh

export NODE_VERSION=v4.2.1
export NODE_PATH=/opt/runtime/node-${NODE_VERSION}
export PATH=${NODE_PATH}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PACKAGES="gcc g++ python make libgcc libstdc++ krb5-dev"

apk --update add ${PACKAGES} && \
cd /opt/app && npm install && \
apk del ${PACKAGES} && \
rm -rf /tmp/* /var/cache/apk/*
