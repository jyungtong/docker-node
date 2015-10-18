#!/bin/sh

export NODE_VERSION=v4.2.1
export NODE_PATH=/opt/runtime/node-${NODE_VERSION}
export PATH=${NODE_PATH}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

apk --update add gcc g++ python make libgcc libstdc++ && \
cd /opt/app && npm install && \
apk del gcc g++ python make libgcc libstdc++ && \
rm -rf /tmp/* /var/cache/apk/*
