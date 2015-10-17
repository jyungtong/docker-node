#!/bin/sh

export NODE_VERSION=v4.2.1
export NODE_PATH=/opt/runtime/node-${NODE_VERSION}

apk add --update curl make gcc g++ python linux-headers paxctl && \
cd /tmp && mkdir -p ${NODE_PATH} && \
curl -sSL https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}.tar.gz | tar -xz && \
cd node-${NODE_VERSION} && \
./configure --prefix=${NODE_PATH} ${CONFIG_FLAGS} && \
make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
make install && \
paxctl -cm ${NODE_PATH}/bin/node && \
cd / && \
if [ -x ${NODE_PATH}/bin/npm ]; then \
  ${NODE_PATH}/bin/npm install -g npm && \
  find ${NODE_PATH}/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf; \
fi && \
apk del curl make gcc g++ python linux-headers paxctl ${DEL_PKGS} && \
rm -rf /etc/ssl /tmp/node-${NODE_VERSION} ${RM_DIRS} \
${NODE_PATH}/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp \
${NODE_PATH}/lib/node_modules/npm/man ${NODE_PATH}/lib/node_modules/npm/doc \
${NODE_PATH}/lib/node_modules/npm/html
