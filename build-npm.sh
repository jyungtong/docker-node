#!/bin/sh

export NODE_VERSION=v4.2.1
export NODE_PATH=/opt/runtime/node-${NODE_VERSION}
export PATH=${NODE_PATH}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

apk --update add gcc g++ python make && \
cd /tmp/ && npm install && \
mv /tmp/node_modules/* /opt/app/node_modules/ && \
apk del gcc g++ python && \
rm -rf /tmp/node_modules /var/cache/apk/*
