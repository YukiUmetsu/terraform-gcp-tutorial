# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service
resource "google_cloud_run_service" "cloud-run-with-tf" {
  name     = "cloud-run-with-tf"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/google-samples/hello-app:1.0"
      }
    }
  }

  # traffic {
  #   percent         = 100
  #   latest_revision = true
  # }
}

data "google_iam_policy" "public" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam
resource "google_cloud_run_service_iam_policy" "policy" {
  location    = google_cloud_run_service.cloud-run-with-tf.location
  service     = google_cloud_run_service.cloud-run-with-tf.name
  policy_data = data.google_iam_policy.public.policy_data
}