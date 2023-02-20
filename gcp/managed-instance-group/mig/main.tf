# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_template
resource "google_compute_instance_template" "instance_template_tf" {
  name           = var.instance-template-tf
  machine_type   = var.machine_type
  region         = var.region
  can_ip_forward = false

  disk {
    source_image = "debian-cloud/debian-11"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "default"
    access_config {
      # Ephemeral public IP
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  service_account {
    email  = "terraform-with-gcp@single-being-153022.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  tags = ["http-server", "https-server"]

  metadata_startup_script = file("./start_script.sh")
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
resource "google_compute_firewall" "allow_http" {
  project = var.project
  name    = "allow-http-rule"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }
  target_tags = ["http-server", "https-server"]

  # If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges.
  # For INGRESS traffic, one of source_ranges, source_tags or source_service_accounts is required.
  source_ranges = ["0.0.0.0/0"]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_health_check
resource "google_compute_health_check" "autohealing" {
  name = var.autohealing_health_check

  timeout_sec         = 5
  check_interval_sec  = 5
  healthy_threshold   = 2
  unhealthy_threshold = 10 # 50 seconds

  http_health_check {
    request_path = "/"
    port         = "80"
  }
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_group_manager
# The Google Compute Engine Instance Group Manager API creates and manages pools of homogeneous Compute Engine 
# virtual machine instances from a common instance template.
resource "google_compute_instance_group_manager" "instance_group_manager_tf" {
  name = var.instance_group_manager

  base_instance_name = "instance-group-tf"
  zone               = var.zone

  version {
    name              = var.instance-template-tf
    instance_template = google_compute_instance_template.instance_template_tf.id
  }

  named_port {
    name = "web"
    port = 80
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.autohealing.id
    initial_delay_sec = 50
  }
}

resource "google_compute_autoscaler" "default" {
  name   = var.autoscaler
  zone   = var.zone
  target = google_compute_instance_group_manager.instance_group_manager_tf.id

  autoscaling_policy {
    max_replicas    = 2
    min_replicas    = 1
    cooldown_period = 60
  }
}