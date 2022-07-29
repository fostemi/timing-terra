variable "repo_name" {
    description = "Name of application code repo in Github"
    type        = string
    default     = "timing-terra"
}


variable "tf_org" {
    description = "TFE organization name"
    type        = string
    default     = ""
}


variable "github_org" {
    description = "Github organization name"
    type        = string
    default     = "fostemi"
}


variable "gcp_project_id" {
    description = "GCP project ID"
    type        = string
    default     = "timing-terra"
}


variable "service_account" {
    description = "GCP service account"
    type        = string
    default     = "goals-977@timing-terra.iam.gserviceaccount.com"
}


variable "dns_project_id" {
    description = "DNS project ID"
    type        = string
    default     = ""
}


variable "dns_zone" {
    description = "DNS zone name"
    type        = string
    default     = ""
}


variable "domain" {
    description = "DNS Domain"
    type        = string
    default     = ""
}


# THESE ARE NOT
variable "use_gke" {
    description = "Whether clusters should get created or not"
    type        = bool
    default     = true
}


variable "use_bastion" {
    description = "Whether bastion host should get created or not"
    type        = bool
    default     = false
}

variable "use_tf" {
    description = "Whether TF should be used for app resources"
    type        = bool
    default     = true
}

variable "use_anthos" {
    description = "Whether clusters should install Anthos services"
    type        = bool
    default     = false
}


variable "use_argocd" {
    description = "Whether Argo CD dns resources should get created"
    type        = bool
    default     = true
}


variable "use_workflows" {
    description = "Whether Argo Workflows dns resources should get created"
    type        = bool
    default     = false
}


variable "use_rollouts" {
    description = "Whether Argo Rollouts dns resources should get created"
    type        = bool
    default     = false
}

variable "machine_type" {
    description = "GKE node machine type"
    type        = string
    default     = "e2-standard-2"
}


variable "app_names" {
    description = "List of app names"
    type        = list(string)
    default = [
      "angular-tour-of-heroes",
    ]
}


variable "shared_vpc_host" {
    type        = bool
    description = "Makes this project a Shared VPC host if 'true' (default 'false')"
    default     = false
}


variable "delete_default_internet_gateway_routes" {
    type        = bool
    description = "If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted"
    default     = false
}


variable "routing_mode" {
    type        = string
    description = "The network routing mode (default 'GLOBAL')"
    default     = "GLOBAL"
}


variable "network_name" {
    type        = string
    description = "Name of VPC"
    default     = "terraform-network"
}


variable "router_name" {
    type        = string
    description = "Name of cloud router"
    default     = "cloud-router"
}


variable "nat_name" {
    type        = string
    description = "Name of Cloud NAT"
    default     = "cloud-nat"
}
/*
variable "apis" {
    type = list
    description = "APIs to enable"
    default = ["iam.googleapis.com", "compute.networks.create"]
}
*/
