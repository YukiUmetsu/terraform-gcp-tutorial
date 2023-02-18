resource "local_sensitive_file" "example_resource" {
  # https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
  filename = "example.txt"
  content = "Master Terraform with GCP"
  file_permission = "0770"
}