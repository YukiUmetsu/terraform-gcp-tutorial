resource "local_file" "example_resource" {
  filename = var.file_name
  content = var.file_content["name"]
}
