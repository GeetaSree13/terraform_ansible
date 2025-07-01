output "instance_ip" {
  description = "External IP of the new VM"
  value       = google_compute_instance.rocky_vm.network_interface[0].access_config[0].nat_ip
}
