output "Identifier" {
  value = google_compute_firewall.rule.id
}

output "creation_timestamp" {
  value = google_compute_firewall.rule.creation_timestamp
}

output "firewall_name" {
  value = google_compute_firewall.rule.name
}

output "firewall_self_link" {
  value = google_compute_firewall.rule.self_link
}
