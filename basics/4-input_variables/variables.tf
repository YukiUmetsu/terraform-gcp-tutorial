variable "file_name" {
    type = string
    default = "example.txt"
}

variable "file_content" {
    type = string
    default = "Master Terraform with GCP"
}

variable "file_permission" {
    type = string
    default = "0770"
}

variable "input_zones" {
    type = list
    default = ["us-west-1a", "us-west-1c", "us-west-1d", "us-west-1e"]
}