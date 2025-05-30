output "cluster_name" {
  description = "GKE cluster name"
  value       = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  description = "GKE cluster endpoint (API server URL)"
  value       = google_container_cluster.primary.endpoint
}

output "cluster_master_version" {
  description = "GKE cluster master version"
  value       = google_container_cluster.primary.node_version
}

output "default_node_pool_name" {
  description = "Name of the default node pool"
  value       = google_container_node_pool.default_pool.name
}

output "default_node_pool_node_count" {
  description = "Node count in default node pool"
  value       = google_container_node_pool.default_pool.initial_node_count
}

output "additional_node_pool_names" {
  description = "Names of additional node pools"
  value       = [for np in google_container_node_pool.additional_pools : np.name]
}

output "additional_node_pool_node_counts" {
  description = "Node counts in additional node pools"
  value       = [for np in google_container_node_pool.additional_pools : np.initial_node_count]
}
