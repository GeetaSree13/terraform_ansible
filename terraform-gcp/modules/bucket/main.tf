resource "google_storage_bucket" "bucket_name" {
  for_each = toset(var.bucket_name)
  name     = each.value
  location = var.location
}