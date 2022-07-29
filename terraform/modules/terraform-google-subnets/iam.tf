resource "google_compute_subnetwork_iam_binding" "network_users" {
  count = length(local.subnets)

  project    = var.network_project_id
  region     = lookup(local.subnets[count.index], "subnet_region", "")
  subnetwork = lookup(local.subnets[count.index], "subnet_name", "")
  role       = "roles/compute.networkUser"

  members = compact(local.subnet_users)

  depends_on = [
    module.subnets,
  ]
}


module "network_iam_bindings" {
  count = var.use_gke && var.gke_project_number != "" ? 1 : 0

  source = "terraform-google-modules/iam/google//modules/projects_iam"

  projects = [var.network_project_id]
  bindings = {
    "roles/container.hostServiceAgentUser" = [
      "serviceAccount:service-${var.gke_project_number}@container-engine-robot.iam.gserviceaccount.com",
    ],
    "roles/compute.securityAdmin" = [
      "serviceAccount:service-${var.gke_project_number}@container-engine-robot.iam.gserviceaccount.com",
    ],
  }
}
