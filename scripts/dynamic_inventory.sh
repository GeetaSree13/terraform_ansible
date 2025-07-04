#!/bin/bash

chmod 600 ../ansible/id_rsa

cd terraform || exit 1  # move into terraform dir or exit if not found
external_ip=$(terraform output -raw vm_ip)

cd ..

if [ -z "$external_ip" ]; then
  echo "❌ ERROR: Failed to fetch external IP from Terraform output"
  exit 1
fi

file="../ansible/inventory.yml"

cat <<EOF > $file
all:
  hosts:
    rocky-vm:
      ansible_host: $external_ip
      ansible_user: rocky
      ansible_ssh_private_key_file: ../ansible/id_rsa
EOF
