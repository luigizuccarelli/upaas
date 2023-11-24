#!/bin/bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage   : pipeline.sh <step>"
  echo "Example : pipeline.sh 1"
  exit 0
fi

case "${1}" in 
    1)
      echo "local install of rust"
      ansible-playbook rust.yml -i inventories/local 
      echo "local install of unikernel ecosystem"
      sleep 5;
      ansible-playbook unikernel.yml -i inventories/local 
      ;;
    2)
      echo "install of unikernel ecosystem on all servers"
      ansible-playbook unikernel.yml -i inventories/servers
    ;;
    3)
      ansible-playbook keepalived.yml -i inventories/servers --tags check
    ;;
    4)
      ansible-playbook load-balancers.yml -i inventories/local --tags fetch-build
    ;;
    5)
      ansible-playbook microservices.yml -i inventories/local --tags fetch-build
    ;;
    6)
      echo "deploy unikernel load balancers"
      ansible-playbook load-balancers.yml -i inventories/servers --tags deploy
      echo "deploy unikernel microservices"
      ansible-playbook microservices.yml -i inventories/services --tags deploy
    ;;
esac
