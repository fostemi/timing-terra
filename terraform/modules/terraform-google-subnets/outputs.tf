output "subnets" {
  description = "GKE subnets"
  value       = module.subnets.subnets
}


output "subnet_name" {
  description = "GKE subnet name"
  value       = local.subnet_name
}


output "region" {
  description = "GCP region"
  value       = var.region
}


output "zones" {
  description = "GKE cluster zones"
  value       = var.zones
}


output "pods_range_name" {
  description = "GKE pods secondary for primary region"
  value       = local.pods_range_name
}


output "services_range_name" {
  description = "GKE services secondary for primary region"
  value       = local.services_range_name
}


output "failover_region" {
  description = "GCP failover region"
  value       = var.failover_region
}


output "failover_zones" {
  description = "List of GCP failover zone"
  value       = var.failover_zones
}


output "failover_subnet_name" {
  description = "GKE subnet for failover"
  value       = local.failover_subnet_name
}


output "failover_pods_range_name" {
  description = "GKE pods secondary for failover region"
  value       = local.failover_pods_range_name
}


output "failover_services_range_name" {
  description = "GKE services secondary for failover region"
  value       = local.failover_services_range_name
}
