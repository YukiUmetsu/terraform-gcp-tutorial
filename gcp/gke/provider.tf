terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.53.1"
    }
  }
}

provider "google" {
  project     = "single-being-153022"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = "../auth/service_account_key.json"
}