terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.1"
    }
  }
}

provider "google" {
  project = "single-being-153022"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "./service_account_key.json"
}

resource "google_storage_bucket" "bucket-from-service-account-udemy-02-18-2023" {
    name = "bucket-from-service-account-udemy-02-18-2023"
    location = "us-central1"
}