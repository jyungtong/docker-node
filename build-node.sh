#!/bin/sh

export ALPINE_VER=3.2
export NODE_VERSION=v4.2.2
export NODE_PATH=/usr/local

# echo "http://repos.lax-noc.com/alpine/${ALPINE_VER}/main" > /etc/apk/repositories && \
apk update && \
apk add curl make gcc g++ python linux-headers paxctl libgcc libstdc++ imagemagick && \
cd /tmp && mkdir -p ${NODE_PATH} && \
curl -SLO https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}.tar.gz && \
tar xzf node-${NODE_VERSION}.tar.gz && \
cd node-${NODE_VERSION} && \
./configure --prefix=${NODE_PATH} && \
make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
make install && \
paxctl -cm ${NODE_PATH}/bin/node && \
cd / && \
if [ -x ${NODE_PATH}/bin/npm ]; then \
  ${NODE_PATH}/bin/npm install -g npm && \
  ${NODE_PATH}/bin/npm install -g foreman && \
  find ${NODE_PATH}/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf; \
fi && \
apk del make gcc g++ linux-headers && \
rm -rf /etc/ssl /tmp/node-${NODE_VERSION} ${RM_DIRS} \
    ${NODE_PATH}/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp \
    ${NODE_PATH}/lib/node_modules/npm/man ${NODE_PATH}/lib/node_modules/npm/doc \
    ${NODE_PATH}/lib/node_modules/npm/html
