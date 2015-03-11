#!/bin/bash

sed -i 's|localhost|'"${DBHOST}"'|g' hello.js
sed -i 's|mongodb//.*/hello_world|mongodb//'"${DBHOST}"'/hello_world|g' hello.js

export NODE_ENV=production
export IOJS_HOME=${IROOT}/iojs-v1.5.1-linux-x64
export PATH=$PATH:$IOJS_HOME/bin

${IOJS_HOME}/bin/npm install
${IOJS_HOME}/bin/iojs hello.js &

# !DO NOT REMOVE!
#
# It takes `node app` a few seconds to turn on and 
# then fork. If you remove this sleep, the parent shell 
# executing this script will be terminated before the 
# application has time to awaken and be forked, and 
# express will fail to be started
sleep 5
