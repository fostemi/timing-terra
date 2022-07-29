module "cloud_nat" {
	source = "terraform-google-modules/cloud-nat/google"
	
	name = var.nat_name
	project_id = var.gcp_project_id
	region = local.region
	router = module.cloud_router.router.name

	depends_on = [
		module.vpc,
		module.cloud_router,
	]
}

module "cloud_nat_failover" {
	source = "terraform-google-modules/cloud-nat/google"

	name = "${var.nat_name}-failover"
	project_id = var.gcp_project_id
	region = local.failover_region
	router = module.cloud_router_failover.router.name

	depends_on = [
		module.vpc,
		module.cloud_router_failover,
	]
}
