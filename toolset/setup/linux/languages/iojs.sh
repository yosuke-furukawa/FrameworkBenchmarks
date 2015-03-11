#!/bin/bash

RETCODE=$(fw_exists ${IROOT}/iojs-v1.5.1.installed)
[ ! "$RETCODE" == 0 ] || { return 0; }

fw_get http://iojs.org/dist/v1.5.1/iojs-v1.5.1-linux-x64.tar.gz
fw_untar iojs-v1.5.1-linux-x64.tar.gz

# Upgrade npm to avoid https://github.com/npm/npm/issues/4984
export IOJS_HOME=${IROOT}/iojs-v1.5.1-linux-x64
export PATH=$PATH:$NODE_HOME/bin

${IOJS_HOME}/bin/npm install -g npm

touch ${IROOT}/iojs-v1.5.1.installed

