terraform {
  backend "gcs" {
    bucket  = "bucket-from-terraform-sa"
    prefix  = "project1/terraform/state"
    credentials = "/gcp-creds/creds.json"
  }
}