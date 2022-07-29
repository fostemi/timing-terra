variable "network_project_id" {
  description = "GCP Network project ID"
  type        = string
}


variable "network_name" {
  description = "Network name"
  type        = string
}



variable "use_gke" {
  description = "Make GKE secondary ranges"
  type        = bool
  default     = true
}


variable "subnet_name" {
  description = "Subnet name"
  type        = string
}


variable "failover_subnet_name" {
  description = "Failover subnet name"
  type        = string
  default     = ""
}


variable "subnet_range" {
  description = "RFC1918 CIDR range used for automl GKE nodes"
  type        = string
}


variable "failover_subnet_range" {
  description = "RFC1918 CIDR range used for automl GKE failover nodes, leave empty if not using failover"
  type        = string
  default     = ""
}


variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}


variable "zones" {
  description = "GKE Cluster Zones"
  type        = list(string)
  default     = ["us-central1-a", "us-central1-b"]
}


variable "failover_region" {
  description = "GCP Failover Region"
  type        = string
  default     = "us-east4"
}


variable "failover_zones" {
  description = "GCP Failover Zone"
  type        = list(string)
  default     = ["us-east4-b", "us-east4-c"]
}


variable "gke_project_number" {
  description = "Project number to attach Network User role to GKE service agents"
  type        = string
  default     = ""
}


variable "gke_iac_sa" {
  description = "GKE IaC service account"
  type        = string
  default     = ""
}


variable "gke_node_sa" {
  description = "GKE node service account"
  type        = string
  default     = ""
}


variable "subnet_users" {
  description = "List of accounts to give Network User role to"
  type        = list(string)
  default     = []
}


variable "pods_range" {
  description = "Non-RFC1918 CIDR range used for GKE pods"
  type        = string
  default     = ""
}


variable "services_range" {
  description = "Non-RFC1918 CIDR range used for GKE services"
  type        = string
  default     = ""
}


variable "failover_pods_range" {
  description = "Non-RFC1918 CIDR range used for automl GKE failover pods"
  type        = string
  default     = ""
}


variable "failover_services_range" {
  description = "Non-RFC1918 CIDR range used for automl GKE failover services"
  type        = string
  default     = ""
}
