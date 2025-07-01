provider "google" {
  credentials = file("/gcp-creds/creds2.json")
  project     = var.project_id
  region      = var.region
}