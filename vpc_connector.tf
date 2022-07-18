/*
* VPC Access Connector for Serverless resources
*/

resource "google_vpc_access_connector" "vpc_connector" {
  name           = "${var.org_prefix}-${var.perimeter}-access-connector"
  project        = module.shared_vpc.project_id
  region         = "europe-west1"
  ip_cidr_range  = var.vpc_connector_ip_range
  network        = module.shared_vpc.network_id
  min_throughput = "500"
  max_throughput = "1000"
}
