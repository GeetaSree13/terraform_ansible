# #!/bin/bash
# set -euo pipefail
# set -x  
 
# echo ">>> Extracting VM info from Terraform output..."
# VM_JSON=$(terraform output -json vm_ip)
 
# # Check if terraform output is valid
# if [ -z "$VM_JSON" ]; then
#   echo " ERROR: Terraform output is empty. Are the VMs created?"
#   exit 1
# fi
 
# # Prepare inventory
# echo ">>> Generating dynamic Ansible inventory at ansible/hosts"
# echo "" > ansible/hosts
# echo "$VM_JSON" | jq -r 'to_entries[] | "\(.key) ansible_host=\(.value.ip) ansible_user=\(.value.username) ansible_ssh_private_key_file=/atlantis/ssh_key"' >> ansible/hosts
 
# cat ansible/hosts
# # Wait for SSH to be ready on all IPs
# echo ">>> Waiting for SSH to be ready on all VMs..."
# for vm in $(echo "$VM_JSON" | jq -r 'to_entries[] | "penumarthigeeta@\(.value.ip)"'); do
#   username=$(echo "$vm" | cut -d@ -f1)
#   ip=$(echo "$vm" | cut -d@ -f2)
#   echo ">>> Checking SSH on $ip with user $username"
#   ssh-keygen -R "$ip" || true
#   for i in {1..15}; do
#     if ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 -i /atlantis/ssh_key "$username@$ip" "echo SSH Ready"; then
#       echo " SSH ready on $ip"
#       break
#     else
#       echo "⏳ SSH not ready yet on $ip... retrying in 5s"
#       sleep 5
#     fi
#   done
# done
 
 
# # Run Ansible Playbook
# echo ">>> Running Ansible Playbook..."
# ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ansible/hosts ansible/site.yml
 
# echo " Ansible execution completed."
 

#!/bin/bash
set -euo pipefail
set -x

echo ">>> Extracting VM IP from Terraform output..."
VM_IP=$(terraform output -raw vm_ip)

# Check if terraform output is valid
if [ -z "$VM_IP" ]; then
  echo "ERROR: Terraform output is empty. Are the VMs created?"
  exit 1
fi

# Prepare inventory
echo ">>> Generating dynamic Ansible inventory at ansible/hosts"
cat > ansible/hosts <<EOF
[rocky]
rocky-vm ansible_host=$VM_IP ansible_user=rocky ansible_ssh_private_key_file=/atlantis/ssh_key
EOF

cat ansible/hosts

# Wait for SSH to be ready
echo ">>> Waiting for SSH to be ready on $VM_IP..."
ssh-keygen -R "$VM_IP" || true
for i in {1..15}; do
  if ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 -i /atlantis/ssh_key rocky@"$VM_IP" "echo SSH Ready"; then
    echo "SSH ready on $VM_IP"
    break
  else
    echo "SSH not ready yet on $VM_IP... retrying in 5s"
    sleep 5
  fi
done

echo ">>> Running Ansible Playbook..."
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ansible/hosts ansible/playbook.yml
 
echo " Ansible execution completed."