/*
*  Allocate an IP address range for Cloud SQL
*/
resource "google_compute_global_address" "cloudsql_private_ip_address" {
  project       = module.shared_vpc.project_id
  name          = "${var.org_prefix}-cloudsql-private-ip-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  address       = split("/", var.cloudsql_ip_range)[0]
  prefix_length = tonumber(split("/", var.cloudsql_ip_range)[1])
  network       = module.shared_vpc.network_id
}

/*
*  Allocate an IP address range for Memorystore
*/
resource "google_compute_global_address" "memorystore_private_ip_address" {
  project       = module.shared_vpc.project_id
  name          = "${var.org_prefix}-memorystore-private-ip-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  address       = split("/", var.memorystore_ip_range)[0]
  prefix_length = tonumber(split("/", var.memorystore_ip_range)[1])
  network       = module.shared_vpc.network_id
}

/*
*  Allocate an IP address range for Filestore
*/
resource "google_compute_global_address" "filestore_private_ip_address" {
  project       = module.shared_vpc.project_id
  name          = "${var.org_prefix}-filestore-private-ip-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  address       = split("/", var.filestore_ip_range)[0]
  prefix_length = tonumber(split("/", var.filestore_ip_range)[1])
  network       = module.shared_vpc.network_id
}

/*
*  Create a private connection
*/
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = module.shared_vpc.network_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [
                              google_compute_global_address.cloudsql_private_ip_address.name,
                              google_compute_global_address.memorystore_private_ip_address.name,
                              google_compute_global_address.filestore_private_ip_address.name,
                            ]
}
