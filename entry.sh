#!/bin/sh

NPM='npm start'

addgroup -S docker 
adduser -s /bin/sh -G docker -D -S docker 
cd /opt/app 

if [ "${1:0:1}" = '-' ]; then
  NPM="$NPM -- $@"
elif [ "$1" != 'npm' ] && [ ! -z "$1" ]; then
  NPM="$@"
fi

su -c "$NPM" docker
