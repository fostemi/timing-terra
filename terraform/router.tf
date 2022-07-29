module "cloud_router" {
	source = "terraform-google-modules/cloud-router/google"
	
	name = var.router_name
	project = var.gcp_project_id
	region = local.region
	network = module.vpc.network_name

	bgp = {
		asn = 65010
		advertised_groups = ["ALL_SUBNETS"]
	}

	depends_on = [
		module.vpc,
	]
}

module "cloud_router_failover" {
	source = "terraform-google-modules/cloud-router/google"
	
	name = "${var.router_name}-failover"
	project = var.gcp_project_id
	region = local.failover_region
	network = module.vpc.network_name

	bgp = {
		asn = 65010
		advertised_groups = ["ALL_SUBNETS"]
	}

	depends_on = [
		module.vpc,
	]
}
