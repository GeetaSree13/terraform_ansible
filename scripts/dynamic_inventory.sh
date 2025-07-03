#!/bin/bash

external_ip=$(terraform chdir=terraform output -raw vm_ip)

file="ansible/inventory.yml"

cat <<EOF > $file
all:
  hosts:
    rocky-vm:
      ansible_host: $external_ip
      ansible_user: rocky
      ansible_ssh_private_key_file: /gcp-creds/ssh_private
EOF      