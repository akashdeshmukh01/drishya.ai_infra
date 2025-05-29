variable "project_id" {
  description = "GCP Project ID where resources will be created"
  type        = string
}

variable "region" {
  description = "GCP region to deploy resources, e.g. us-central1"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "routing_mode" {
  description = "Routing mode for the VPC (REGIONAL or GLOBAL)"
  type        = string
  default     = "REGIONAL"
}

variable "subnet_name" {
  description = "Name of the subnet within the VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR IP range for the subnet, e.g. 10.10.0.0/24"
  type        = string
}

variable "private_ip_google_access" {
  description = "Enable Private Google Access on the subnet to allow instances without external IPs to access Google APIs"
  type        = bool
  default     = true
}

variable "ssh_source_ip" {
  description = "Source IP range allowed for SSH access (CIDR notation), e.g. 203.0.113.4/32"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

# Default node pool variables
variable "default_node_pool" {
  description = "Default node pool configuration"
  type = object({
    name                 = string
    node_count           = number
    machine_type         = string
    min_count            = number
    max_count            = number
    auto_scaling_enabled = bool
  })
  default = {
    name                 = "systempool"
    node_count           = 1
    machine_type         = "e2-medium"
    min_count            = 1
    max_count            = 3
    auto_scaling_enabled = true
  }
}

# Additional node pools, list of objects
variable "additional_node_pools" {
  description = "List of additional node pool configurations"
  type = list(object({
    name                 = string
    machine_type         = string
    node_count           = number
    min_count            = number
    max_count            = number
    auto_scaling_enabled = bool
    node_taints          = optional(list(string))
    max_pods             = optional(number)
    node_labels          = optional(map(string))
    tags                 = optional(map(string))
  }))
  default = []
}

variable "db_password" {
  description = "Password for Cloud SQL DB user"
  type        = string
  sensitive   = true
}

variable "enabled_apis" {
  description = "List of APIs to enable"
  type        = list(string)
}

variable "pods_range_name" {
  description = "Secondary range name for GKE pods"
  type        = string
}

variable "pods_ip_range" {
  description = "CIDR range for GKE pods"
  type        = string
}

variable "services_range_name" {
  description = "Secondary range name for GKE services"
  type        = string
}

variable "services_ip_range" {
  description = "CIDR range for GKE services"
  type        = string
}


variable "repo_name" {
  type        = string
  description = "Name of the Docker repository in Artifact Registry"
}

variable "bucket_name" {
  type        = string
  description = "Cloud Storage bucket name"
}

variable "location" {
  type        = string
  description = "Location or region for resources"
}


