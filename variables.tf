variable "perimeter" {
  type        = string
  description = "perimeter"
}

variable "org_prefix" {
  type        = string
  description = "Organization name prefix"
}

variable "host_project_id" {
  type        = string
  description = "Host Project ID"
}

variable "shared_vpc_name" {
  type        = string
  description = "shared vpc name"
}

variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}

variable "private_service_connect_ip" {
  type        = string
  description = "private service connect endpoint"
}

variable "cloudsql_ip_range" {
  type        = string
  description = "private service connection: Cloud SQL ip range"
}

variable "memorystore_ip_range" {
  type        = string
  description = "private service connection: Memorystore ip range"
}

variable "filestore_ip_range" {
  type        = string
  description = "private service connection: Filestore ip range"
}

variable "vpc_connector_ip_range" {
  type        = string
  description = "vpc connector ip range"
}
