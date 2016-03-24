#!/bin/bash

set -eu

if [ -n "${WEBAPP_DISTRO_URL+1}" ]
then
  echo 'Distribution found'
  wget $WEBAPP_DISTRO_URL -P ${USER_HOME}/downloads
  copy-distribution.sh ${USER_HOME}/downloads ${CATALINA_BASE}
else
  echo 'No distribution'
  copy-distribution.sh ${USER_HOME}/distributions ${CATALINA_BASE}
fi

exec $@