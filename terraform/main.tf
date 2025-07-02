provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  credentials = file(var.credentials_file)
}

resource "google_compute_disk" "extra_disk" {
  name  = "extra-disks"
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
