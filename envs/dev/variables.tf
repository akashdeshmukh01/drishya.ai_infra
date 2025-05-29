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

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
}

variable "machine_type" {
  description = "Machine type for GKE nodes, e.g. e2-medium"
  type        = string
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
