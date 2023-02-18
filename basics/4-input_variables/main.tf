resource "local_sensitive_file" "example_resource" {
  filename = var.file_name
  content = var.file_content
  file_permission = var.file_permission
}

resource "random_shuffle" "az" {
  input        = var.input_zones
  result_count = 2
}

output "result_zones_output" {
    value = random_shuffle.az.result
}