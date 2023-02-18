resource "local_file" "learning_tf" {
  filename = "terraform.txt"
  content = "I'm learning terraform basics"
}

resource "local_file" "learning_gcp" {
  filename = "gcp.txt"
  content = "I'm learning gcp"
}
