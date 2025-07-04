#!/bin/bash
chmod 600 ../ansible/id_rsa
external_ip=$(terraform output -raw vm_ip)

file="../ansible/inventory.yml"

cat <<EOF > $file
all:
  hosts:
    rocky-vm:
      ansible_host: $external_ip
      ansible_user: penumarthigeetasri
      ansible_ssh_private_key_file: ../ansible/id_rsa
EOF    
