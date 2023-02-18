module "simple_module" {
    source = "../modules"
    id_length = 5
    min_int = 0
    max_int = 100
}

output "random_id" {
    value = module.simple_module.result1
}

output "random_int" {
    value = module.simple_module.result2
}