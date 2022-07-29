locals {
  
  region = "us-central1"
  zones  = ["us-central1-a", "us-central1-b"]
  zone   = local.zones[0]


  subnet_name         = "gke-subnet-primary"
  pods_range_name     = "pods-primary"
  services_range_name = "services-primary"

  master_range   = "10.0.0.0/28"
  subnet_range   = "10.0.128.0/21"
  pods_range     = "240.0.0.0/13"
  services_range = "240.64.0.0/22"

  failover_region = "us-east4"
  failover_zones  = ["us-east4-b", "us-east4-c"]
  failover_zone   = local.failover_zones[0]

  failover_subnet_name         = "gke-subnet-failover"
  failover_pods_range_name     = "pods-failover"
  failover_services_range_name = "services-failover"

  failover_master_range   = "10.0.64.16/28"
  failover_subnet_range   = "10.0.144.0/21"
  failover_pods_range     = "240.8.0.0/13"
  failover_services_range = "240.64.16.0/22"

  cluster_name          = "primary-cluster"
  failover_cluster_name = "failover-cluster"

  use_bastion = var.use_gke && var.use_bastion

  use_argocd    = var.use_gke && var.use_argocd
  use_workflows = var.use_gke && var.use_workflows
  use_rollouts  = var.use_gke && var.use_rollouts
}

