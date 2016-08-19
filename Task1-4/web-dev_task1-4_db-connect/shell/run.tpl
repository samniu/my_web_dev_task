#!/bin/bash
JAVA_PATH="${{java.path}}"
JETTY_HOME="${{JETTY_HOME}}"

PROJ_PATH="${{project.dir}}"
PROJ_NAME="${{project.name}}"
CLASS_DIR="${PROJ_PATH}/web/WEB-INF/classes"
JAR_PATH="${{jar.path}}"
LIB_DIR="${PROJ_PATH}/lib/"
LIB_DIR="${JETTY_HOME}/lib/"
CP="${CLASS_DIR}:${JETTY_HOME}/start.jar"
MAIN="${{main-class}}"
LOG_DIR="${PROJ_PATH}/logs"
TMP_DIR="${PROJ_PATH}/tmp"

OPT="-Dfile.encoding=UTF-8"
OPT="$OPT -Xmx128m"
OPT="$OPT -Djava.io.tmpdir=${TMP_DIR}"
OPT="$OPT -Djetty.home=${JETTY_HOME}"
OPT="$OPT -Dlog.dir=${LOG_DIR}"
OPT="$OPT -Djetty.port=${{server.port}}"
OPT="$OPT -DSTOP.PORT=${{stop.port}}"
OPT="$OPT -DSTOP.KEY=${{stop.key}}"
OPT="$OPT -Dcontext.path=${{context.path}}"
OPT="$OPT -Dproject.version=${{project.version}}"
OPT="$OPT -Dproject.dir=${{project.dir}}"

for i in `ls ${LIB_DIR}`; do
        CP="${CP}"":""${LIB_DIR}${i}";
done

PROGRAM_ARG="dir=${PROJ_PATH}"

cd ${PROJ_PATH}

mkdir -p ${TMP_DIR}

# create data and log dir
if [ -f "system.conf" ] ; then
        RUN_MODE=`head -n 1 system.conf | awk -F '=' '($1=="mod"){print $2}'`
fi

if [ ! -d "${LOG_DIR}" ] ; then
        if [ -d "${PROJ_DATADIR}/log" ] ; then
                ln -s "${PROJ_DATADIR}/log" "${LOG_DIR}" 2>/dev/null
        fi

        if [ ! -d "${LOG_DIR}" ] ; then
                mkdir "${LOG_DIR}" 2>/dev/null
        fi
fi

if [[ "$1" == "debug" ]]; then
${JAVA_PATH} ${OPT} -cp ${CP} -jar ${JETTY_HOME}/start.jar --ini=jetty/start.ini
else
${JAVA_PATH} ${OPT} -cp ${CP} -jar ${JETTY_HOME}/start.jar --ini=jetty/start.ini </dev/null >/dev/null 2>&1 
fi
