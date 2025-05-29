variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "region" {
  description = "GCP region to deploy the GKE cluster"
  type        = string
}

/*variable "zone" {
  description = "The zone to create the GKE cluster in (for zonal cluster)"
  type        = string
}*/

variable "vpc_id" {
  description = "The ID of the VPC network to attach the cluster to"
  type        = string
}

variable "subnet_self_link" {
  description = "The self_link of the subnet for the cluster"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 3
}

variable "machine_type" {
  description = "Machine type for the nodes"
  type        = string
  default     = "e2-medium"
}
