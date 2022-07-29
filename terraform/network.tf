module "vpc" {
    source       = "terraform-google-modules/network/google//modules/vpc"
    project_id = var.gcp_project_id
    network_name = var.network_name 
    routing_mode = "REGIONAL"
    shared_vpc_host = false
    delete_default_internet_gateway_routes = false
}
