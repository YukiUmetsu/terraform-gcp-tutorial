# this just output random int, string, password, random items from an array

resource "random_integer" "random_int" {
  min = 10
  max = 100
}

resource "random_string" "random_str" {
  length           = 10
  special          = false
}

resource "random_password" "random_pass" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_shuffle" "az" {
  input        = ["us-west-1a", "us-west-1c", "us-west-1d", "us-west-1e"]
  result_count = 2
}

output "result1" {
  value = random_integer.random_int.result
}

output "result2" {
  value = random_string.random_str.result
}

output "result3" {
  value = random_password.random_pass.result
  sensitive = true
}

output "result4" {
  value = random_shuffle.az.result
}