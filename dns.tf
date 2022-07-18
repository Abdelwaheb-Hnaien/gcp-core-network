// DNS records
module "dns-private-zone" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = "3.0.0"
  project_id = module.shared_vpc.project_id
  type       = "private"
  name       = "${module.shared_vpc.project_id}-dns-zone-private-googleapis-com" # zone name
  domain     = "googleapis.com."   # dns name

  private_visibility_config_networks = [
    module.shared_vpc.network_self_link
  ]

  recordsets = [
    {
      name    = "private"
      type    = "A"
      ttl     = 300
      records = [
        resource.google_compute_global_address.default.address
      ]
    },
    {
      name    = "restricted"
      type    = "A"
      ttl     = 300
      records = [
        resource.google_compute_global_address.default.address
      ]
    },
    {
      name    = "*"
      type    = "CNAME"
      ttl     = 300
      records = [
        "private.googleapis.com.",
      ]
    },
  ]
}
