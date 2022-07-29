module "gke" {
  count = local.use_gke ? 1 : 0

  source = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster-update-variant"

  project_id = var.gke_project_id
  name       = var.cluster_name

  regional           = var.regional
  region             = var.region
  zones              = var.zones
  network            = var.network_name
  network_project_id = var.network_project_id
  subnetwork         = var.subnet_name
  ip_range_pods      = var.pods_range_name
  ip_range_services  = var.services_range_name

  http_load_balancing        = true
  horizontal_pod_autoscaling = true
  create_service_account     = false
  remove_default_node_pool   = true
  # add_shadow_firewall_rules  = true

  enable_private_nodes   = true
  master_ipv4_cidr_block = var.master_range
  network_policy         = var.network_policy

  istio            = var.istio
  cloudrun         = var.cloudrun
  dns_cache        = var.dns_cache
  config_connector = var.config_connector
  kalm_config      = var.kalm_config

  release_channel   = var.release_channel
  datapath_provider = var.datapath_provider

  node_pools              = local.node_pools
  node_pools_oauth_scopes = var.node_pools_oauth_scopes
  node_pools_labels       = var.node_pools_labels
  node_pools_metadata     = var.node_pools_metadata
  node_pools_tags         = var.node_pools_tags

}


module "failover_gke" {
  count = local.use_gke && local.use_failover ? 1 : 0

  source = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster-update-variant"

  project_id = var.gke_project_id
  name       = var.failover_cluster_name

  regional           = var.regional
  region             = var.failover_region
  zones              = var.failover_zones
  network            = var.network_name
  network_project_id = var.network_project_id
  subnetwork         = var.failover_subnet_name
  ip_range_pods      = var.failover_pods_range_name
  ip_range_services  = var.failover_services_range_name

  http_load_balancing        = true
  horizontal_pod_autoscaling = true
  create_service_account     = false
  remove_default_node_pool   = true
  # add_shadow_firewall_rules  = true

  enable_private_nodes   = true
  master_ipv4_cidr_block = var.failover_master_range
  network_policy         = var.network_policy

  istio            = var.istio
  cloudrun         = var.cloudrun
  dns_cache        = var.dns_cache
  config_connector = var.config_connector
  kalm_config      = var.kalm_config

  release_channel   = var.release_channel
  datapath_provider = var.datapath_provider

  node_pools              = local.node_pools
  node_pools_oauth_scopes = var.node_pools_oauth_scopes
  node_pools_labels       = var.node_pools_labels
  node_pools_metadata     = var.node_pools_metadata
  node_pools_tags         = var.node_pools_tags

}
