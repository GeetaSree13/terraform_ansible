terraform {
  backend "gcs" {
    bucket  = "my-bucket-project2"
    prefix  = "project2/terraform/state"
    credentials = "/gcp-creds/creds2.json"
  }
}

