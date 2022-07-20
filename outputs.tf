output "network" {
  value = module.shared_vpc.network_id
  description = "The VPC resource being created"
}

output "network_id" {
  value = module.shared_vpc.network_id
  description = "The ID of the VPC being created"
}

output "network_name" {
  value = module.shared_vpc.network_name
  description = "The name of the VPC being created"
}

output "network_self_link" {
  value = module.shared_vpc.network_self_link
  description = "The URI of the VPC being created"
}

output "project_id" {
  value = module.shared_vpc.project_id
  description = "VPC project id"
}
