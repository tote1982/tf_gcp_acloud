provider "google" {
  credentials = file("terraform-key.json")

  project = "playground-s-11-4b972644"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

terraform {
  backend "gcs" {
    bucket = "terraform_tote_bucket"
    prefix = "terraform/state"
    credentials = "terraform-key.json"
  }
}
