/*
*  SHARED VPC Network
*/

module "shared_vpc" {
    source  = "terraform-google-modules/network/google//modules/vpc"
    version = "5.1.0"

    project_id   = var.host_project_id
    network_name = "${var.shared_vpc_name}-${var.perimeter}"

    shared_vpc_host = true
}

/*
*  Subnets
*/

module "subnets" {
    source  = "terraform-google-modules/network/google//modules/subnets"
    version = "5.1.0"
    project_id   =  module.shared_vpc.project_id
    network_name =  module.shared_vpc.network_self_link
    subnets = var.subnets
}
