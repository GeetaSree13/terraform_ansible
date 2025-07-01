output "name" {
    value = {
        vpc_network_name   = google_compute_network.vpc_network.name
        subnet1_name       = google_compute_subnetwork.subnet1.name
    }
}