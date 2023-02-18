variable "file_name" {
    type = string
    default = "example.txt"
}

# variable "file_content" {
#     type = string
#     default = "Master Terraform with GCP"
# }

# variable "file_content" {
#     type = tuple([string, number, bool])
#     default = ["hello world", 2023, true]
# }

variable "file_content" {
    type = map
    default = {
        name = "hello world"
    }
}
