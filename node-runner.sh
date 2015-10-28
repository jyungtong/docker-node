#! /bin/sh

apk --update add libgcc libstdc++ && \
  rm -rf /var/cache/apk/*
