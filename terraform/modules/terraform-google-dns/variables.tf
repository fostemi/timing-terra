variable "dns_project" {
  description = "DNS project"
  type        = string
}

variable "ip_project" {
  description = "External IP project (likely to be GKE project)"
  type        = string
}


variable "domain" {
  description = "DNS domain"
  type        = string
}


variable "ip_names" {
  description = "IP address to create"
  type        = list(string)
  default = [
    "dev",
    "test",
    "stage",
    "prod",
  ]
}


variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}


variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}
