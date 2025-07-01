resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = false

  
}

resource "google_compute_subnetwork" "subnet1" {
    name=var.subnet1_name
    network = google_compute_network.vpc_network.id
    ip_cidr_range = var.subnet1_cidr

    
}