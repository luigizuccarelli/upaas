# Overview

## Using ansible to install and deploy

- clone this repo

- cd into upaas/ansible

- execute the install and setup pf keepalived

```
ansible-playbook keepalived.yml -i load-balancers  --tags=keepalived --extra-vars="ansible_sudo_pass=<sudo-password>" --extra-vars="user_dir=<local-user-home>"
```

## Fetch and build load balancer rust project

```
ansible-playbook load-balancers.yml -i local --tags=fetch-build --extra-vars="user_dir=<local-user-dir>"
```

## Start the load balancer services

```
ansible-playbook load-balancers.yml  -i load-balancers  --tags=start --extra-vars="user_dir=<local-user-dir>"
```

