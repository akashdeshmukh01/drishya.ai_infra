output "vpc_id" {
  description = "VPC network ID"
  value       = google_compute_network.vpc_network.id
}

output "subnet_id" {
  description = "Subnetwork ID"
  value       = google_compute_subnetwork.subnet.id
}

output "network_self_link" {
  description = "Self link of the VPC network"
  value       = google_compute_network.vpc_network.self_link
}

output "subnet_self_link" {
  description = "Self link of the subnet"
  value       = google_compute_subnetwork.subnet.self_link
}

output "subnet_ip_cidr_range" {
  description = "IP CIDR range of the subnet"
  value       = google_compute_subnetwork.subnet.ip_cidr_range
}

output "network_name" {
  description = "Name of the VPC network"
  value       = google_compute_network.vpc_network.name
}

output "subnet_name" {
  description = "Name of the subnet"
  value       = google_compute_subnetwork.subnet.name
}
