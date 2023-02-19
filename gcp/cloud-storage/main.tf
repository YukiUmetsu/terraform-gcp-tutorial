resource "google_storage_bucket" "bucket_from_tf_02182023" {
    name = "bucket_from_tf_02182023"
    location = "US"
    labels = {
        "gcp" = "cloud-storage"
        "terraform" = "cs-object1"
    }
    storage_class = "MULTI_REGIONAL"
    uniform_bucket_level_access = false

    lifecycle_rule {
        condition {
            age = 30
        }
        action {
            type = "SetStorageClass"
            storage_class = "ARCHIVE"
        }
    }
}

resource "google_storage_bucket_object" "gcp_tf_image" {
  name   = "gcp_tf_image"
  bucket = google_storage_bucket.bucket_from_tf_02182023.name
  source = "./gcp-terraform.png"
}

resource "google_storage_object_access_control" "public_rule" {
  object = google_storage_bucket_object.gcp_tf_image.name
  bucket = google_storage_bucket.bucket_from_tf_02182023.name
  role   = "READER"
  entity = "allUsers"
}