#!/bin/bash
echo "$PRIVATE_SSH_KEY_CONTENT" > /tmp/id_rsa
chmod 600 /tmp/id_rsa
external_ip=$(terraform chdir=terraform output -raw vm_ip)

file="ansible/inventory.yml"

cat <<EOF > $file
all:
  hosts:
    rocky-vm:
      ansible_host: $external_ip
      ansible_user: rocky
      ansible_ssh_private_key_file: "/tmp/id_rsa"
EOF      