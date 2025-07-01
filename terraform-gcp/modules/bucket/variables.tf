variable "bucket_name" {
  description = "The names of the storage buckets"
  type        = list(string)
}

variable "location" {
  description = "The location of the storage bucket"
  type        = string
  default     = "asia-southeast1"
  
}