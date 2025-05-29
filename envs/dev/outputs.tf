output "vpc_id" {
  description = "The ID of the created VPC network"
  value       = module.vpc.vpc_id
}

output "subnet_id" {
  description = "The ID of the created subnet"
  value       = module.vpc.subnet_id
}

output "subnet_self_link" {
  description = "The self link of the created subnet"
  value       = module.vpc.subnet_self_link
}

output "gke_cluster_name" {
  description = "Name of the GKE cluster"
  value       = module.gke.cluster_name
}

output "gke_cluster_endpoint" {
  description = "Endpoint of the GKE cluster"
  value       = module.gke.cluster_endpoint
}

output "gke_cluster_version" {
  description = "Master version of the GKE cluster"
  value       = module.gke.cluster_master_version
}

output "gke_default_node_pool_name" {
  description = "Name of the default node pool"
  value       = module.gke.default_node_pool_name
}

output "gke_default_node_pool_node_count" {
  description = "Node count of the default node pool"
  value       = module.gke.default_node_pool_node_count
}

output "gke_additional_node_pool_names" {
  description = "List of additional node pool names"
  value       = module.gke.additional_node_pool_names
}

output "gke_additional_node_pool_node_counts" {
  description = "List of additional node pool node counts"
  value       = module.gke.additional_node_pool_node_counts
}

output "cloud_sql_instance_connection_name" {
  description = "Connection name of the Cloud SQL instance"
  value       = module.cloud_sql_postgres.instance_connection_name
}

output "gcr_repo_url" {
  description = "Docker repo URL"
  value       = module.gcr.repo_url
}
