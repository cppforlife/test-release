#!/bin/bash

JOB_NAME=http_proxy_with_requires
RUN_DIR=/var/vcap/sys/run/$JOB_NAME
LOG_DIR=/var/vcap/sys/log/$JOB_NAME
PIDFILE=$RUN_DIR/pid

mkdir -p $RUN_DIR $LOG_DIR
chown -R vcap:vcap $RUN_DIR $LOG_DIR

exec 1>> $LOG_DIR/$JOB_NAME.stdout.log
exec 2>> $LOG_DIR/$JOB_NAME.stderr.log

source /var/vcap/packages/http_proxy/pid_utils.sh

case $1 in

  start)
    pid_guard $PIDFILE $JOB_NAME

    echo $$ > $PIDFILE

    <% host = link("http_endpoint")["nodes"].first["networks"].first["address"] %>

    exec chpst -u vcap:vcap /var/vcap/packages/http_proxy/bin/proxy \
      --port <%= p("http_proxy_with_requires.listen_port") %> \
      --backend-addr <%= host + ":" + p("http_proxy_with_requires.backend_port") %>

    ;;

  stop)
    kill_and_wait $PIDFILE

    ;;

  *)
    echo "Usage: $0 {start|stop}"

    ;;

esac
