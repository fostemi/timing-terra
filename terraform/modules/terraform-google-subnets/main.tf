module "subnets" {
  source = "terraform-google-modules/network/google//modules/subnets"

  project_id   = var.network_project_id
  network_name = var.network_name

  subnets          = local.subnets
  secondary_ranges = local.secondary_ranges

}
