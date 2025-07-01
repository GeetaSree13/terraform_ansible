resources = {
  "bucket" = true
  "vm"     = false
  "service_account" = false
  "vpc" = false
}


project_id = "tonal-benefit-462606-b8"
region      = "asia-southeast1"
zone        = "asia-southeast1-a"
bucket_name = [
  "bucket-geeta13-bucket1",
  #"bucket-geeta13-bucket2",
  "bucket-geeta13-bucket3"
  ]
location    = "asia-southeast1"
vpc_name    = "my-vpc-network1-project1"
subnet1_name = "my-subnet-2"
vm_name     = "terraform-instance-project1"
machine_type = "e2-medium"
account_id   = "my-service-account-project1"
display_name = "My Service Account Project1"
sa_roles     = [
  "roles/compute.admin"]
sa_name = "my-service-account-project1"
subnet1_cidr = "10.0.1.0/24"
