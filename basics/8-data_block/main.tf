# read only data source usually from outside
# https://developer.hashicorp.com/terraform/language/data-sources
data "local_file" "data1" {
    filename = "example.txt"
}

output "name1" {
    value = data.local_file.data1.content
}