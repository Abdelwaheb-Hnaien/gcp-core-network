# IAP

data "google_netblock_ip_ranges" "iap-forwarders" {
  range_type = "iap-forwarders"
}

resource "google_compute_firewall" "allow-iap-ssh" {
  project = module.shared_vpc.project_id
  name    = "${var.org_prefix}-shared-xpn-${var.perimeter}-fwr-vpc-ing-allow-iap-ssh"
  network = module.shared_vpc.network_self_link

  direction     = "INGRESS"
  source_ranges = data.google_netblock_ip_ranges.iap-forwarders.cidr_blocks_ipv4
  target_tags   = ["iap-ssh"]

  allow {
    protocol = "tcp"
    ports    = ["22", "2220"]
  }

  priority       = 1000
  enable_logging = true

}

resource "google_compute_firewall" "allow-iap-rdp" {
  project = module.shared_vpc.project_id
  name    = "${var.org_prefix}-shared-xpn-${var.perimeter}-fwr-vpc-ing-allow-iap-rdp"
  network = module.shared_vpc.network_self_link

  direction     = "INGRESS"
  source_ranges = data.google_netblock_ip_ranges.iap-forwarders.cidr_blocks_ipv4
  target_tags   = ["iap-rdp"]

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  priority       = 1000
  enable_logging = true
}

resource "google_compute_firewall" "allow-iap-http" {
  project = module.shared_vpc.project_id
  name    = "${var.org_prefix}-shared-xpn-${var.perimeter}-fwr-vpc-ing-allow-iap-http"
  network = module.shared_vpc.network_self_link

  direction     = "INGRESS"
  source_ranges = data.google_netblock_ip_ranges.iap-forwarders.cidr_blocks_ipv4
  target_tags   = ["iap-http"]

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "8081"]
  }

  priority       = 1000
  enable_logging = true
}

resource "google_compute_firewall" "allow-iap-https" {
  project = module.shared_vpc.project_id
  name    = "${var.org_prefix}-shared-xpn-${var.perimeter}-fwr-vpc-ing-allow-iap-https"
  network = module.shared_vpc.network_self_link

  direction     = "INGRESS"
  source_ranges = data.google_netblock_ip_ranges.iap-forwarders.cidr_blocks_ipv4
  target_tags   = ["iap-https"]

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  priority       = 1000
  enable_logging = true
}
