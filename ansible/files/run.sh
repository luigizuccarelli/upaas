#!/bin/bash

set -euxo pipefail 

if [ "$#" -ne 1 ];
then
  echo -e "usage run.sh <start|stop>"
  exit 1
fi

case ${1} in
  start)
    echo -e "version v0.1.0"
    echo -e "project rust-tls-microservice"
    ./rust-tls-microservice  
    exit 0
  ;;
  stop)
    ID=$(ps -ef | grep -v 'grep' | grep rust-tls-microservice | awk '{print $2}')
    echo -e "stopping microservice with PID $ID"
    kill -9 $ID
    exit 0
  ;;
esac
