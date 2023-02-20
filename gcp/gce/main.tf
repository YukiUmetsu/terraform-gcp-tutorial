# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
resource "google_compute_instance" "vm-from-tf" {
  name         = "vm-from-tf"
  zone         = "us-central1-c"
  machine_type = "e2-micro"

  tags = ["terraform", "vm-instance"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  scheduling {
    preemptible = false
    automatic_restart = false
  }

  service_account {
    email = "terraform-with-gcp@single-being-153022.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = file("./start_script.sh")
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk
resource "google_compute_disk" "disk-1" {
    name = "disk-1"
    size = 15
    zone = "us-central1-c"
    type = "pd-ssd"
}

# attach disk to virtual machine: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_attached_disk
resource "google_compute_attached_disk" "attach-disk" {
  disk     = google_compute_disk.disk-1.name
  instance = google_compute_instance.vm-from-tf.id
}