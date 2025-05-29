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
  value = module.gke.cluster_name
}

output "gke_cluster_endpoint" {
  value = module.gke.cluster_endpoint
}

output "gke_cluster_version" {
  value = module.gke.cluster_master_version
}

output "gke_node_pool_name" {
  value = module.gke.node_pool_name
}

output "gke_node_pool_node_count" {
  value = module.gke.node_pool_node_count
}
