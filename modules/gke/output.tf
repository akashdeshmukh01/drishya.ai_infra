output "cluster_name" {
  description = "Name of the GKE cluster"
  value       = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  description = "Endpoint of the GKE cluster"
  value       = google_container_cluster.primary.endpoint
}

output "cluster_location" {
  description = "Region or zone of the GKE cluster"
  value       = google_container_cluster.primary.location
}

output "node_pool_name" {
  description = "Node pool name"
  value       = google_container_node_pool.primary_nodes.name
}

output "node_pool_node_count" {
  description = "Number of nodes in the node pool"
  value       = google_container_node_pool.primary_nodes.node_count
}

output "cluster_master_version" {
  description = "The Kubernetes master version"
  value       = google_container_cluster.primary.master_version
}