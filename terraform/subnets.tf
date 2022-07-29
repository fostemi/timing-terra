module "subnets" {
  source = "./modules/terraform-google-subnets"

  network_project_id = var.gcp_project_id
  network_name       = module.vpc.network_name

  # gke_project_number = local.gke_project_number
  gke_iac_sa  = var.service_account
  gke_node_sa = var.service_account

  subnet_name    = local.subnet_name
  subnet_range   = local.subnet_range
  pods_range     = local.pods_range
  services_range = local.services_range

  failover_subnet_name    = local.failover_subnet_name
  failover_subnet_range   = local.failover_subnet_range
  failover_pods_range     = local.failover_pods_range
  failover_services_range = local.failover_services_range

  depends_on = [
    module.vpc,
  ]
}
