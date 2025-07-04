provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  credentials = file(var.google_credentials)
}

resource "google_compute_instance" "rocky_vms" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      size  = var.boot_disk_size
    }
  }

  network_interface {
    network       = var.network
    access_config {}
  }

  metadata = {
  ssh-keys = "penumarthigeetasri:${file("id_rsa.pub")}"
}


    
  tags = var.tags

}

resource "google_compute_firewall" "allowing-http" {
    name    = "allowing-http"
    network = "default"

    allow {
        protocol = "tcp"
        ports    = ["80"]
    }
    direction     = "INGRESS"
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["http-server"]

    lifecycle {
      create_before_destroy = true
    }

}

resource "google_compute_firewall" "allowing-https" {
    name = "allowing-https"
    network = "default"

    allow {
      protocol = "tcp"
      ports = ["443"]
    }

    direction     = "INGRESS"
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["https-server"]

    lifecycle {
        create_before_destroy = true
    }
}

