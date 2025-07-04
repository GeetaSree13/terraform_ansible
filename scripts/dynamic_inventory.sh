#!/bin/bash
chmod 644 ../ansible/id_rsa
external_ip=$(terraform output -raw vm_ip)

inventory_file="../ansible/inventory.yml"

echo "all:" > "$inventory_file"
echo "  hosts:" >> "$inventory_file"
echo "    rocky-vm:" >> "$inventory_file"
echo "      ansible_host: $external_ip" >> "$inventory_file"
echo "      ansible_user: penumarthigeeta" >> "$inventory_file"
echo "      ansible_ssh_private_key_file: ../ansible/id_rsa" >> "$inventory_file"
echo "      ansible_ssh_common_args: '-o StrictHostKeyChecking=no'" >> "$inventory_file"
