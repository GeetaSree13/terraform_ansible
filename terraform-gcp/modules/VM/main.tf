resource "google_compute_instance" "vm_instance" {
    name =var.vm_name
    machine_type = var.machine_type
    zone = var.zone


boot_disk {
  initialize_params {
    image = "projects/rocky-linux-cloud/global/images/family/rocky-linux-9"
    size = 20
  }
}

network_interface {
  network = "default"
  access_config {
  }
}
tags = ["http-server", "https-server"]

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