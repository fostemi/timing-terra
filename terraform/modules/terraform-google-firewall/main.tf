resource "google_compute_firewall" "rule" {
  name        = var.firewall_rule_name
  project     = var.project
  network     = var.network
  priority    = var.priority
  direction   = var.direction
  description = var.description

  dynamic "allow" {
    for_each = var.allow_protocol_ports
    content {
      protocol = allow.key
      ports    = allow.value
    }
  }

  dynamic "deny" {
    for_each = var.deny_protocol_ports
    content {
      protocol = deny.key
      ports    = deny.value
    }
  }

  target_tags             = var.target_tags
  target_service_accounts = var.target_service_accounts
  source_tags             = var.direction == "INGRESS" ? var.source_tags : null

  source_ranges      = var.direction == "INGRESS" ? var.source_ranges : null
  destination_ranges = var.direction == "EGRESS" ? var.destination_ranges : null

  dynamic "log_config" {
    for_each = var.enable_logs ? toset([0]) : []
    content {
      metadata = var.log_metadata
    }
  }
}
