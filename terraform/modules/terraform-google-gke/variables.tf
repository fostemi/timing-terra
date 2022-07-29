variable "network_project_id" {
  description = "Network project ID"
  type        = string
}


variable "gke_project_id" {
  description = "GKE project ID"
  type        = string
}


variable "gke_node_sa" {
  description = "GKE Node SA"
  type        = string
}


variable "network_name" {
  description = "Network name"
  type        = string
}


variable "subnet_name" {
  description = "GKE Subnet name"
  type        = string
}


variable "pods_range_name" {
  description = "Pods Secondary Name"
  type        = string
}


variable "services_range_name" {
  description = "Services Secondary Name"
  type        = string
}


variable "master_range" {
  description = "CIDR block to be used for the GKE master"
  type        = string
}


variable "failover_subnet_name" {
  description = "GKE subnet for failover"
  type        = string
  default     = ""
}


variable "failover_pods_range_name" {
  description = "Failover pods secondary name"
  type        = string
  default     = ""
}


variable "failover_services_range_name" {
  description = "Failover services secondary name"
  type        = string
  default     = ""
}


variable "failover_master_range" {
  description = "CIDR block to be used for the GKE failover master"
  type        = string
  default     = ""
}


variable "master_authorized_networks" {
  description = "Authorized network for both primary and failover cluster"
  type        = list(object({ cidr_block = string, display_name = string }))
  default     = []
}


variable "github_owner" {
  description = "Github owner"
  type        = string
  default     = "MavenWave-DevOps"
}


variable "acm_repo_name" {
  description = "ACM Wet Repo Name"
  type        = string
  default     = ""
}


variable "dry_repo_name" {
  description = "ACM Wet Repo Name"
  type        = string
  default     = ""
}


variable "use_gke" {
  description = "Whether or not cluster gets created"
  type        = bool
  default     = true
}


variable "use_anthos" {
  description = "Whether or not cluster gets registered with Anthos and installs Config Management"
  type        = bool
  default     = false
}


variable "cluster_name" {
  description = "Primary cluster name"
  type        = string
  default     = "central-cluster"
}

variable "failover_cluster_name" {
  description = "Failover cluster name"
  type        = string
  default     = "east-cluster"
}


variable "regional" {
  description = "Regional or Zonal cluster"
  type        = string
  default     = true
}


variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}


variable "zones" {
  description = "GKE Cluster Zones"
  type        = list(string)
  default     = ["us-central1-a"]
}


variable "failover_region" {
  description = "GCP Failover Region"
  type        = string
  default     = "us-east4"
}


variable "failover_zones" {
  description = "GCP Failover Zone"
  type        = list(string)
  default     = ["us-east4-b"]
}


variable "failover_zone" {
  description = "GCP Failover Zone"
  type        = string
  default     = "us-east4-b"
}


variable "release_channel" {
  description = "GKE Release Channel"
  type        = string
  default     = "REGULAR"
}


variable "acm_version" {
  description = "Anthos Config Management version"
  type        = string
  default     = "1.10.2"
}


variable "acm_source_format" {
  description = "Anthos Config Management source format"
  type        = string
  default     = "hierarchy"
}


variable "network_policy" {
  description = "Whether or not to use Kubernetes Network Policy"
  type        = bool
  default     = false
}


variable "istio" {
  description = "Whether or not Istio should be enabled"
  type        = bool
  default     = false
}


variable "cloudrun" {
  description = "Whether or not Cloudrun should be enabled"
  type        = bool
  default     = false
}


variable "dns_cache" {
  description = "Whether or not DNS Cache should be enabled"
  type        = bool
  default     = false
}


variable "config_connector" {
  description = "Whether or not config connector should be enabled"
  type        = bool
  default     = false
}


variable "kalm_config" {
  description = "Whether or not k8s application lifecycle manager should be enabled"
  type        = bool
  default     = false
}


variable "datapath_provider" {
  description = "Set to ADVANCED_DATAPATH to enable Dataplane v2"
  type        = string
  default     = "ADVANCED_DATAPATH"
}


variable "disk_type" {
  description = "Node pool disk type"
  type        = string
  default     = "pd-standard"
}


variable "machine_type" {
  description = "Image type for node pools"
  type        = string
  default     = "e2-medium"
}


variable "image_type" {
  description = "Image type for node pools"
  type        = string
  default     = "COS"
}


variable "max_regular" {
  description = "Max number of nodes in regular node pool"
  type        = number
  default     = 2
}


variable "max_preemptible" {
  description = "Max number of nodes in preemptible node pool"
  type        = number
  default     = 3
}



variable "node_pools_oauth_scopes" {
  description = "Node pool OAuth scopes"
  type        = map(list(string))
  default = {
    all = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]
  }
}
variable "node_pools" {
  description = "Node pools. Leave blank to use default preemptible and regular node pools"
  type        = list(map(string))
  default     = []
}


variable "node_pools_labels" {
  description = "Node pool labels"
  type        = map(map(string))
  default = {
    all = {}

    general-pool = {
      app = "general"
    }

    preemptible-pool = {
      app = "preemptible"
    }

  }
}


variable "node_pools_metadata" {
  description = "Node pool meta data"
  type        = map(map(string))
  default     = {}
}


variable "node_pools_tags" {
  description = "Node pool tags"
  type        = map(list(string))
  default     = {}
}


variable "security_policy_name" {
  description = "Name of Cloud Armor US Only security policy"
  type        = string
  default     = "us-only"
}


variable "ssl_policy_name" {
  description = "Name of SSL policy"
  type        = string
  default     = "tls-12"
}


variable "acm_secret_type" {
  description = "Secret type to allow ACM to connect to Git, (https/ssh)"
  type        = string
  default     = "ssh"
}


variable "acm_manifests_dir" {
  description = "ACM manifests directory"
  type        = string
  default     = "/manifests"
}


variable "enable_gatekeeper" {
  description = "Whether Gatekeeper should be enabled for ACM"
  type        = bool
  default     = true
}
