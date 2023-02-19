# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "auto-vpc-tf" {
    name = "auto-vpc-tf"
    auto_create_subnetworks = true
}

resource "google_compute_network" "custom-vpc-tf" {
    name = "custom-vpc-tf"
    auto_create_subnetworks = false
}


# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

resource "google_compute_subnetwork" "asia-southeast1-subnet" {
    name = "asia-southeast1-subnet"
    network = google_compute_network.custom-vpc-tf.id
    ip_cidr_range = "10.1.0.0/24"
    region = "asia-southeast1"
}

resource "google_compute_firewall" "allow-icmp" {
    name = "allow-icmp"
    network = google_compute_network.custom-vpc-tf.id
    allow {
        protocol = "icmp"
    }
    source_ranges = ["72.191.37.57/32"]
    priority = 500
}

output "auto" {
    value = google_compute_network.auto-vpc-tf.id
}

output "custom" {
    value = google_compute_network.custom-vpc-tf.id
}