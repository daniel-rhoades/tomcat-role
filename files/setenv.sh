#! /bin/sh
JAVA_HOME=/usr/java/default
JAVA_ENDORSED_DIRS=/usr/local/share/tomcat-endorsed

CATALINA_HOME="/usr/local/tomcat"
CATALINA_BASE="/opt/cms/tomcat"
CATALINA_PID="${CATALINA_BASE}/work/catalina.pid"

CLUSTER_ID="$(whoami)-$(hostname -f)"

MAX_HEAP=512
MIN_HEAP=256

JVM_OPTS="-server -Xmx${MAX_HEAP}m -Xms${MIN_HEAP}m"
DMP_OPTS="-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/opt/cms/heapdumps"

# Run environment scripts in ${USER_HOME}/environment
for SCRIPT in ${USER_HOME}/environment/*
do
    if [ -f $SCRIPT -a -x $SCRIPT ]
    then
        eval "$($SCRIPT)"
    fi
done

CATALINA_OPTS="${JVM_OPTS} ${DMP_OPTS}"

export JAVA_HOME CATALINA_HOME CATALINA_BASE