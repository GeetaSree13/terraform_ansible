provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  credentials = file(var.credentials_file)
}

resource "google_compute_disk" "extra_disk" {
  name  = "extra-disk"
  type  = var.additional_disk_type  # e.g., "pd-ssd"
  zone  = var.zone
  size  = var.additional_disk_size  # e.g., 50
}

resource "google_compute_instance" "rocky_vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      size  = var.boot_disk_size
    }
  }

  attached_disk {
    source      = google_compute_disk.extra_disk.id
    device_name = "extra-disk"
  }

  network_interface {
    network       = var.network
    access_config {}
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key_path)}"
  }

  tags = var.tags
}

output "instance_ip" {
  value = google_compute_instance.rocky_vm.network_interface[0].access_config[0].nat_ip
}

# Auto‑generate Ansible inventory with the fresh external IP
resource "null_resource" "generate_inventory" {
  provisioner "local-exec" {
    command = <<EOT
echo "[rocky]
rocky-vm ansible_host=${google_compute_instance.rocky_vm.network_interface[0].access_config[0].nat_ip} ansible_user=${var.ssh_user} ansible_ssh_private_key_file=~/.ssh/id_rsa" > ../ansible/inventory.yml
EOT
  }
  depends_on = [google_compute_instance.rocky_vm]
}
