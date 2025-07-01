variable "bucket_name" {
  description = "The name of the bucket to create."
  type        = list(string)
  
}

variable "location" {
  description = "The location of the storage bucket"
  type        = string
  
}

variable "project_id" {
  description = "The ID of the project where the bucket will be created"
  type        = string
  
}


variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
  
}

variable "subnet1_name" {
  description = "The name of the first subnet"
  type        = string
  
}

variable "region" {
  description = "The region where the VPC and subnets will be created"
  type        = string
  default     = "asia-southeast1"
  
}


variable "vm_name" {
  description = "The name of the VM instance"
  type        = string
  
}

variable "machine_type" {
  description = "The machine type for the VM instance"
  type        = string
  default     = "e2-medium"
  
}

variable "zone" {
  description = "The zone where the VM instance will be created"
  type        = string
  default     = "asia-southeast1-a"
  
}

variable "sa_name" {
  description = "The name of the service account"
  type        = string
  
}

variable "sa_roles" {
  description = "A list of roles to assign to the service account"
  type        = list(string)
  default     = ["roles/viewer", "roles/storage.objectAdmin"]
  
}

variable "account_id" {
  description = "The ID of the service account to create"
  type        = string
}


variable "display_name" {
  description = "The display name of the service account"
  type        = string
  default     = "My Service Account"
  
}

variable "subnet1_cidr" {
  description = "The CIDR range for the first subnet"
  type        = string
}

variable "resources" {
  description = "Map to control which modules to create"
  type        = map(bool)
  
}