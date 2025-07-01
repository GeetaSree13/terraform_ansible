variable "project_id"           { description = "GCP project ID" }
variable "region"               { description = "GCP region" }
variable "zone"                 { description = "GCP zone" }
variable "credentials_file"     { description = "Path to service‑account JSON" }

variable "instance_name"        { description = "VM name" }
variable "machine_type"         { description = "Machine type" }

variable "boot_disk_image"      { description = "Boot disk image" }
variable "boot_disk_size"       { description = "Boot disk size (GB)" }

variable "additional_disk_size" { description = "Extra disk size (GB)" }
variable "additional_disk_type" { description = "Extra disk type" }

variable "network"              { description = "VPC network name" }

variable "tags" {
  type        = list(string)
  description = "Network tags"
}

variable "ssh_user"             { description = "OS user (e.g. rocky)" }
variable "ssh_pub_key_path"     { description = "Path to .pub key" }
