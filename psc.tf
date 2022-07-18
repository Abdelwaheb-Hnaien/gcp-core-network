/*
*  Private Service Connect
*/

// Global internal adress
resource "google_compute_global_address" "default" {
  provider     = google-beta
  project      = module.shared_vpc.project_id
  name         = "${var.org_prefix}-global-psconnect-ip"
  address_type = "INTERNAL"
  purpose      = "PRIVATE_SERVICE_CONNECT"
  network      = module.shared_vpc.network_id
  address      = var.private_service_connect_ip
}

// global forwarding rule
resource "google_compute_global_forwarding_rule" "default" {
  provider              = google-beta
  project               = module.shared_vpc.project_id
  name                  = "${var.perimeter}globalfwrpsc"
  target                = "all-apis"
  network               = module.shared_vpc.network_id
  ip_address            = google_compute_global_address.default.id
  load_balancing_scheme = ""
}
