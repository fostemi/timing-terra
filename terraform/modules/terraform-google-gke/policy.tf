resource "google_compute_security_policy" "policy" {
  project = var.gke_project_id
  name    = var.security_policy_name

  rule {
    action   = "deny(404)"
    priority = "1000"
    match {
      expr {
        expression = "origin.region_code != 'US'"
      }
    }
    description = "Deny access outside US"
  }

  rule {
    action   = "allow"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "default rule"
  }
}


resource "google_compute_ssl_policy" "ssl_policy" {
  project = var.gke_project_id

  name            = var.ssl_policy_name
  profile         = "MODERN"
  min_tls_version = "TLS_1_2"
}
