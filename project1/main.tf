module "bucket" {
  source       = "../terraform-gcp/modules/bucket"
  bucket_name = var.bucket_name
  location    = var.location
  count = var.resources["bucket"] ? 1 : 0
  
}

module "vpc" {
  source        = "../terraform-gcp/modules/VPC"
  network_name  = var.vpc_name
  subnet1_name  = var.subnet1_name
  subnet1_cidr  = var.subnet1_cidr
  count         = var.resources["vpc"] ? 1 : 0

}

module "vm" {
  source = "../terraform-gcp/modules/VM"
  vm_name = var.vm_name
  machine_type = var.machine_type
  zone = var.zone
  count = var.resources["vm"] ? 1 : 0

}


module "service_account" {
  source       = "../terraform-gcp/modules/service_account"
  account_id   = var.account_id
  display_name = var.display_name
  sa_roles     = var.sa_roles
  project_id   = var.project_id
  count = var.resources["service_account"] ? 1 : 0

}

