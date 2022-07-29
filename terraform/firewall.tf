

module "iap_ingress" {
    source = "./modules/terraform-google-firewall"

  firewall_rule_name = "allow-iap"
  network            = module.vpc.network_name
  project            = var.gcp_project_id
  priority           = 1100
  direction          = "INGRESS"
  description        = "Allow SSH Ingress using IAP"
  allow_protocol_ports = {
      tcp = [22]
  }
  source_ranges = ["35.235.240.0/20"]

  depends_on = [
    module.vpc
  ]
}


module "master_ingress" {
    source = "./modules/terraform-google-firewall"

  firewall_rule_name = "master-ingress"
  network            = module.vpc.network_name
  project            = var.gcp_project_id
  priority           = 1100
  direction          = "INGRESS"
  description        = "Admission Controller and HTTPS ingress to GKE master ranges"
  allow_protocol_ports = {
      tcp = [443, 8443, 8676]
  }
  source_ranges = [local.master_range, local.failover_master_range]
  enable_logs   = true

  depends_on = [
    module.vpc
  ]
}


module "allow_egress" {
    source = "./modules/terraform-google-firewall"

  firewall_rule_name = "allow-egress"
  network            = module.vpc.network_name
  project            = var.gcp_project_id
  priority           = 65535
  direction          = "EGRESS"
  description        = "Allow all egress"
  allow_protocol_ports = {
      all = []
  }
  target_tags        = []
  destination_ranges = ["0.0.0.0/0"]
  enable_logs        = true

  depends_on = [
    module.vpc
  ]
}


module "deny_ingress" {
    source = "./modules/terraform-google-firewall"

  firewall_rule_name = "deny-ingress"
  network            = module.vpc.network_name
  project            = var.gcp_project_id
  priority           = 65534
  direction          = "INGRESS"
  description        = "Deny ingress for all ports"
  deny_protocol_ports = {
      all = []
  }
  target_tags   = []
  source_ranges = ["0.0.0.0/0"]
  enable_logs   = true

  depends_on = [
    module.vpc
  ]
}



module "istio_ingress" {
    source = "./modules/terraform-google-firewall"

  firewall_rule_name = "istio-master-ingress"
  network            = module.vpc.network_name
  project            = var.gcp_project_id
  priority           = 1100
  direction          = "INGRESS"
  description        = "Istio ingress to GKE master range"
  allow_protocol_ports = {
      tcp = [10250, 443, 15017]
  }
  source_ranges = [local.master_range, local.failover_master_range]
  enable_logs   = true

  depends_on = [
    module.vpc
  ]
}
