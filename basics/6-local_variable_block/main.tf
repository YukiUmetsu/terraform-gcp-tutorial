locals {
    content_question = "How much do you love"
}


resource "local_file" "learning_tf" {
  filename = "terraform.txt"
  content = "${local.content_question} Terraform"
}

resource "local_file" "learning_gcp" {
  filename = "gcp.txt"
  content = "${local.content_question} GCP"
}

resource "local_file" "learning_ansible" {
  filename = "ansible.txt"
  content = "${local.content_question} Ansible"
}