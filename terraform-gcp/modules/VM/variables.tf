variable "firewall_name_http" {
  description = "The name of the firewall rule for HTTP traffic"
  type        = string
  default     = "allow-http"
  
}

variable "firewall_name_https" {
  description = "The name of the firewall rule for HTTPS traffic"
  type        = string
  default     = "allow-https"
  
}

variable "vm_name" {
  description = "The name of the virtual machine instance"
  type        = string
  
}

variable "machine_type" {
  description = "The machine type for the virtual machine instance"
  type        = string
  default     = "e2-medium"
  
}

variable "zone" {
  description = "The zone where the virtual machine instance will be created"
  type        = string
  
}