output "names" {
  value = [for b in google_storage_bucket.bucket_name : b.value.name]
}