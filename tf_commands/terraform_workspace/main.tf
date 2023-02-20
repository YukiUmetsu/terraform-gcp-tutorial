locals {
  instance_name = "${terraform.workspace}-instance"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
resource "google_compute_instance" "vm-from-tf" {
  name         = var.name
  zone         = var.zone
  machine_type = var.machine_type

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
    preemptible       = false
    automatic_restart = false
  }

  service_account {
    email  = "terraform-with-gcp@single-being-153022.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  labels = {
    "name" = local.instance_name
  }
}