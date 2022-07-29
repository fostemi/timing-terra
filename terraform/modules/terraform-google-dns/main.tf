locals {
  dns_zone = "dns-zone"
}


resource "google_dns_managed_zone" "dns_zone" {
  project = var.dns_project

  name        = local.dns_zone
  dns_name    = "${var.domain}."
  description = "GCP DNS zone"
  dnssec_config {
    state = "on"
  }
}


resource "google_compute_global_address" "global_ip" {
  count = length(var.ip_names)

  project = var.ip_project
  name    = "${var.ip_names[count.index]}-ip"
}


resource "google_dns_record_set" "dns_record_set" {
  count = length(var.ip_names)

  project = var.dns_project

  managed_zone = local.dns_zone
  name         = var.ip_names[count.index] == "prod" ? "${var.domain}." : "${var.ip_names[count.index]}.${var.domain}."
  type         = "A"
  rrdatas      = [google_compute_global_address.global_ip[count.index].address]
  ttl          = 86400

  depends_on = [google_dns_managed_zone.dns_zone, google_compute_global_address.global_ip]
}
