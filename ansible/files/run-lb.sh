#!/bin/bash

set -euxo pipefail 

if [ "$#" -ne 1 ];
then
  echo -e "usage run.sh <start|stop>"
  exit 1
fi

case ${1} in
  start)
    echo -e "version v1.0.0"
    echo -e "project convey load balancer"
    ./convey --config lb-setup.toml 
    exit 0
  ;;
  stop)
    ID=$(ps -ef | grep -v 'grep' | grep convey | awk '{print $2}')
    echo -e "stopping convey lb service with PID $ID"
    kill -9 $ID
    exit 0
  ;;
esac
