#! /bin/sh
JAVA_HOME=/usr/java/default
JAVA_ENDORSED_DIRS=/usr/local/share/tomcat-endorsed

CATALINA_HOME="/usr/local/tomcat"
CATALINA_BASE="/opt/cms/tomcat"
CATALINA_PID="${CATALINA_BASE}/work/catalina.pid"

CLUSTER_ID="$(whoami)-$(hostname -f)"

MAX_HEAP=512
MIN_HEAP=256

# Run environment scripts in ${USER_HOME}/environment
for SCRIPT in ${USER_HOME}/environment/*
do
    if [ -f $SCRIPT -a -x $SCRIPT ]
    then
        eval "$($SCRIPT)"
    fi
done

CATALINA_OPTS="${JVM_OPTS} ${REP_OPTS} ${DMP_OPTS} ${RMI_OPTS} ${L4J_OPTS} ${JRC_OPTS} ${CONTENTSTORE_OPTS}"

export JAVA_HOME CATALINA_HOME CATALINA_BASE