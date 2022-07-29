module "gke" {
	
	source = "./modules/terraform-google-gke"

	use_gke	= var.use_gke
	use_anthos = var.use_anthos

	regional = true
	network_project_id = var.gcp_project_id
	gke_project_id = var.gcp_project_id
	gke_node_sa = var.service_account

	cluster_name = local.cluster_name
	network_name = var.network_name
	subnet_name = local.subnet_name
	region = local.region
  zones = local.zones
	pods_range_name = local.pods_range_name
	services_range_name = local.services_range_name
	master_range = local.master_range
	machine_type = var.machine_type

	failover_region = local.failover_region
	failover_zones = local.failover_zones
	failover_pods_range_name = local.failover_pods_range_name
	failover_services_range_name = local.failover_services_range_name
	failover_master_range = local.failover_master_range

	config_connector = true

	depends_on = [
		module.vpc,
		module.subnets
	]
}
