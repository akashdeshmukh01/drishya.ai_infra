variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "vpc_id" {
  description = "VPC network id"
  type        = string
}

variable "subnet_self_link" {
  description = "Subnet self link"
  type        = string
}

variable "pods_range_name" {
  description = "Secondary IP range name for pods"
  type        = string
}

variable "services_range_name" {
  description = "Secondary IP range name for services"
  type        = string
}

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
}

variable "additional_node_pools" {
  description = "Additional node pools"
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
