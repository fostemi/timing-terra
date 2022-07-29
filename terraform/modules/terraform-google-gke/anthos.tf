resource "null_resource" "wait_for_gke" {
  count = local.use_anthos ? 1 : 0

  triggers = {
    endpoint       = module.gke[0].endpoint
    ca_certificate = module.gke[0].ca_certificate
  }
}


resource "null_resource" "wait_for_failover_gke" {
  count = local.use_anthos && local.use_failover ? 1 : 0
  triggers = {
    endpoint       = module.failover_gke[0].endpoint
    ca_certificate = module.failover_gke[0].ca_certificate
  }
}


resource "google_gke_hub_feature" "feature" {
  count = local.use_anthos ? 1 : 0

  project  = var.gke_project_id
  name     = "configmanagement"
  location = "global"
  provider = google-beta
}


resource "google_gke_hub_membership" "membership" {
  count = local.use_anthos ? 1 : 0

  membership_id = "${var.cluster_name}-membership"
  project       = var.gke_project_id
  provider      = google-beta

  authority {
    issuer = "https://container.googleapis.com/v1/${module.gke[0].cluster_id}"
  }

  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/${module.gke[0].cluster_id}"
    }
  }
  depends_on = [
    null_resource.wait_for_gke[0],
    resource.google_gke_hub_feature.feature[0]
  ]
}

resource "google_gke_hub_feature_membership" "feature_member" {
  count = local.use_anthos ? 1 : 0

  project    = var.gke_project_id
  provider   = google-beta
  location   = "global"
  feature    = google_gke_hub_feature.feature[0].name
  membership = google_gke_hub_membership.membership[0].membership_id
  configmanagement {
    version = var.acm_version
    config_sync {
      source_format = var.acm_source_format
      git {
        sync_repo   = local.acm_git_repo
        sync_branch = local.git_branch
        policy_dir  = var.acm_manifests_dir
        secret_type = var.acm_secret_type
      }
    }
    policy_controller {
      enabled                    = var.enable_gatekeeper
      template_library_installed = true
      referential_rules_enabled  = true
    }
  }

  depends_on = [
    resource.google_gke_hub_feature.feature[0],
    resource.google_gke_hub_membership.membership[0],
  ]
}


resource "google_gke_hub_membership" "membership_failover" {
  count = local.use_anthos && local.use_failover ? 1 : 0

  membership_id = "${var.failover_cluster_name}-membership"
  project       = var.gke_project_id
  provider      = google-beta

  authority {
    issuer = "https://container.googleapis.com/v1/${module.failover_gke[0].cluster_id}"
  }

  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/${module.failover_gke[0].cluster_id}"
    }
  }
  depends_on = [
    null_resource.wait_for_failover_gke[0],
    resource.google_gke_hub_feature.feature[0]
  ]
}

resource "google_gke_hub_feature_membership" "feature_member_failover" {
  count = var.use_anthos && local.use_failover ? 1 : 0

  project    = var.gke_project_id
  provider   = google-beta
  location   = "global"
  feature    = google_gke_hub_feature.feature[0].name
  membership = google_gke_hub_membership.membership_failover[0].membership_id
  configmanagement {
    version = var.acm_version
    config_sync {
      source_format = var.acm_source_format
      git {
        sync_repo   = local.acm_git_repo
        sync_branch = local.git_branch
        policy_dir  = var.acm_manifests_dir
        secret_type = var.acm_secret_type
      }
    }
    policy_controller {
      enabled                    = var.enable_gatekeeper
      template_library_installed = true
      referential_rules_enabled  = true
    }
  }

  depends_on = [
    resource.google_gke_hub_feature.feature[0],
    resource.google_gke_hub_membership.membership_failover[0],
  ]
}
