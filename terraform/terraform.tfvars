project_id           = "tonal-benefit-462606-b8"
region               = "asia-southeast1"
zone                 = "asia-southeast1-a"
credentials_file     = "/gcp-creds/creds.json"

instance_name        = "rocky-vm"
machine_type         = "e2-medium"
boot_disk_image      = "rocky-linux-cloud/rocky-linux-8"
boot_disk_size       = 20

additional_disk_size = 50
additional_disk_type = "pd-ssd"

network              = "default"
tags                 = ["rocky"]
ssh_user             = "rocky"
ssh_pub_key_path     = "~/.ssh/id_rsa.pub"
