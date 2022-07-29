locals {
  use_gke      = var.use_gke
  use_failover = local.use_gke && var.failover_subnet_name != ""
  use_anthos   = local.use_gke && var.use_anthos

  acm_git_repo = "git@github.com:${var.github_owner}/${var.acm_repo_name}.git"
  git_branch   = "main"

  node_pools = length(var.node_pools) == 0 ? [
    {
      name               = "general-pool"
      machine_type       = var.machine_type
      min_count          = 0
      max_count          = var.max_regular
      local_ssd_count    = 0
      disk_size_gb       = 50
      disk_type          = var.disk_type
      image_type         = var.image_type
      auto_repair        = true
      auto_upgrade       = true
      service_account    = var.gke_node_sa
      preemptible        = false
      initial_node_count = 0
    },
    {
      name               = "preemptible-pool"
      machine_type       = var.machine_type
      min_count          = 0
      max_count          = var.max_preemptible
      local_ssd_count    = 0
      disk_size_gb       = 50
      disk_type          = var.disk_type
      image_type         = var.image_type
      auto_repair        = true
      auto_upgrade       = true
      service_account    = var.gke_node_sa
      preemptible        = true
      initial_node_count = 1
    },
  ] : var.node_pools
}
