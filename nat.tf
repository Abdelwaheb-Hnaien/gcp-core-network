module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 0.4"
  project = module.shared_vpc.project_id
  name    = "${var.org_prefix}-nat-cloud-router-${var.perimeter}"
  network = module.shared_vpc.network_id
  region  = "europe-west1"

  nats = [{
    name = "${var.org_prefix}-nat-gateway-${var.perimeter}"
  }]
}
