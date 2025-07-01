provider "google" {
  credentials = file("/gcp-creds/creds.json")
  project     = var.project_id
  region      = var.region
}