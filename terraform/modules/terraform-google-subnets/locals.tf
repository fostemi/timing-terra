locals {
  subnet_name          = var.subnet_name
  failover_subnet_name = var.failover_subnet_name != "" ? var.failover_subnet_name : "${var.subnet_name}-failover"


  subnet = {
    subnet_name           = local.subnet_name
    subnet_ip             = var.subnet_range
    subnet_region         = var.region
    subnet_private_access = "true"
  }

  failover_subnet = {
    subnet_name           = local.failover_subnet_name
    subnet_ip             = var.failover_subnet_range
    subnet_region         = var.failover_region
    subnet_private_access = "true"
  }

  use_failover = var.failover_subnet_range != ""
  subnets      = local.use_failover ? [local.subnet, local.failover_subnet] : [local.subnet]

  subnet_users = var.use_gke ? concat([
    # "serviceAccount:service-${var.gke_project_number}@container-engine-robot.iam.gserviceaccount.com",
    # "serviceAccount:service-${var.gke_project_number}@containerregistry.iam.gserviceaccount.com",
    # "serviceAccount:${var.gke_project_number}@cloudservices.gserviceaccount.com",
    "serviceAccount:${var.gke_iac_sa}",
    "serviceAccount:${var.gke_node_sa}",
  ], var.subnet_users) : var.subnet_users

  pods_range_name          = "pods-primary"
  failover_pods_range_name = "pods-failover"

  services_range_name          = "services-primary"
  failover_services_range_name = "services-failover"

  secondary_ranges = var.use_gke ? {
    (local.subnet_name) = [
      {
        range_name    = local.pods_range_name
        ip_cidr_range = var.pods_range
      },
      {
        range_name    = local.services_range_name
        ip_cidr_range = var.services_range
      }
    ]
    (local.failover_subnet_name) = [
      {
        range_name    = local.failover_pods_range_name
        ip_cidr_range = var.failover_pods_range
      },
      {
        range_name    = local.failover_services_range_name
        ip_cidr_range = var.failover_services_range
      }
    ]
  } : {}

}
