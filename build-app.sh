#! /bin/sh

export NODE_VERSION=v4.2.1
export NODE_PATH=/opt/runtime/node-${NODE_VERSION}
export PATH=${NODE_PATH}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PACKAGES="libgcc libstdc++"

apk --update add ${PACKAGES} && \
rm -rf /var/cache/apk/*

