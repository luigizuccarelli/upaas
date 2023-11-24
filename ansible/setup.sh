#!/bin/bash

set -euxo pipefail

ANSIBLE_USER=lzuccarelli
PROJECT_DIR=Projects
ANSIBLE_SUDO_PASSWORD=<sudo-password>
# sed needs to escape /
USER_DIR="\/home\/lzuccarelli"

# sed each file with the values set above

# keepalived server-a.yml
sed -i "s/ansible_user: [a-zA-Z]*/ansible_user: ${ANSIBLE_USER}/g" roles/keepalived/vars/server-a.yml
sed -i "s/projects_dir: [a-zA-Z]*/projects_dir: ${PROJECT_DIR}/g" roles/keepalived/vars/server-a.yml
sed -i "s/user_dir: [a-zA-Z\/]*/user_dir: ${USER_DIR}/g" roles/keepalived/vars/server-a.yml
# add relevant special chars for your password 
sed -i "s/ansible_sudo_pass: [a-zA-Z\*\!]*/ansible_sudo_pass: ${ANSIBLE_SUDO_PASSWORD}/g" roles/keepalived/vars/server-a.yml

# keepalived server-a.yml
sed -i "s/ansible_user: [a-zA-Z]*/ansible_user: ${ANSIBLE_USER}/g" roles/keepalived/vars/server-b.yml
sed -i "s/projects_dir: [a-zA-Z]*/projects_dir: ${PROJECT_DIR}/g" roles/keepalived/vars/server-b.yml
sed -i "s/user_dir: [a-zA-Z\/]*/user_dir: ${USER_DIR}/g" roles/keepalived/vars/server-b.yml
# add relevant special chars for your password 
sed -i "s/ansible_sudo_pass: [a-zA-Z\*\!]*/ansible_sudo_pass: ${ANSIBLE_SUDO_PASSWORD}/g" roles/keepalived/vars/server-b.yml

# microservices
sed -i "s/ansible_user: [a-zA-Z]*/ansible_user: ${ANSIBLE_USER}/g" roles/microservices/vars/load-balancers.yml
sed -i "s/projects_dir: [a-zA-Z]*/projects_dir: ${PROJECT_DIR}/g" roles/microservices/vars/load-balancers.yml
sed -i "s/user_dir: [a-zA-Z\/]*/user_dir: ${USER_DIR}/g" roles/microservices/vars/load-balancers.yml

sed -i "s/ansible_user: [a-zA-Z]*/ansible_user: ${ANSIBLE_USER}/g" roles/microservices/vars/workers.yml
sed -i "s/projects_dir: [a-zA-Z]*/projects_dir: ${PROJECT_DIR}/g" roles/microservices/vars/workers.yml
sed -i "s/user_dir: [a-zA-Z\/]*/user_dir: ${USER_DIR}/g" roles/microservices/vars/workers.yml

# rust role
sed -i "s/ansible_user: [a-zA-Z]*/ansible_user: ${ANSIBLE_USER}/g" roles/rust/vars/main.yml
sed -i "s/projects_dir: [a-zA-Z]*/projects_dir: ${PROJECT_DIR}/g" roles/rust/vars/main.yml

# unikernel role
sed -i "s/ansible_user: [a-zA-Z]*/ansible_user: ${ANSIBLE_USER}/g" roles/unikernel/vars/main.yml
sed -i "s/projects_dir: [a-zA-Z]*/projects_dir: ${PROJECT_DIR}/g" roles/unikernel/vars/main.yml
sed -i "s/user_dir: [a-zA-Z\/]*/user_dir: ${USER_DIR}/g" roles/unikernel/vars/main.yml

