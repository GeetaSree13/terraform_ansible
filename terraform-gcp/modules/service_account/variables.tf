variable "account_id" {
  description = "The ID of the service account"
  type        = string
  
}

variable "display_name" {
  description = "The display name of the service account"
  type        = string
  
}

variable "project_id" {
  description = "The ID of the project where the service account will be created"
  type        = string
  
}

variable "sa_roles" {
  description = "A list of roles to assign to the service account"
  type        = list(string)
}