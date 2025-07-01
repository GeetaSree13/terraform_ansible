#variables for terraform-gcp module setup

resources = {
  "bucket" = false
  "vm"     = true
  "service_account" = false
  "vpc" = false
}
#


project_id = "stable-parsec-462607-h1"
region      = "asia-southeast1"
zone        = "asia-southeast1-a"
bucket_name = ["bucket-project2"]
location    = "asia-southeast1"
vpc_name    = "my-vpc-network-project2"
subnet1_name = "my-subnet-project2"
vm_name     = "terraform-instance-project2"
machine_type = "e2-medium"
account_id   = "my-service-account-project2"
display_name = "My Service Account Project2"
sa_roles     = [
  "roles/compute.admin"]
sa_name = "my-service-account-project2"
subnet1_cidr = "10.0.1.0/24"
