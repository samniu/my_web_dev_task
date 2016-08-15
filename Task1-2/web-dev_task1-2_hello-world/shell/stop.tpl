#!/bin/bash
JAVA_PATH="${{java.path}}"
JETTY_HOME="${{JETTY_HOME}}"

PROJ_PATH="${{project.dir}}"
CP="${JETTY_HOME}/start.jar"

OPT="-Dfile.encoding=UTF-8"
OPT="$OPT -Djetty.home=${JETTY_HOME}"
OPT="$OPT -DSTOP.PORT=${{stop.port}}"
OPT="$OPT -DSTOP.KEY=${{stop.key}}"

${JAVA_PATH} ${OPT} -jar ${JETTY_HOME}/start.jar --stop