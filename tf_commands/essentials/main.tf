resource "google_compute_network" "auto-vpc-tf" {
    name = "auto-vpc-tf"
    auto_create_subnetworks = true
}

output "auto" {
    value = google_compute_network.auto-vpc-tf.id
}