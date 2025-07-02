#!/bin/bash

# Get the public IP from terraform output
VM_IP=$(cd terraform && terraform output -raw vm_ip)

# Generate inventory.yaml
cat <<EOF > ansible/inventory.yml
all:
  hosts:
    rocky-vm:
      ansible_host: $VM_IP
      ansible_user: atlantis
      ansible_ssh_private_key_file: /home/atlantis/.ssh/id_rsa
EOF
