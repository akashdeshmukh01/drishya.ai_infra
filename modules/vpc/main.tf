resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = var.routing_mode
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = var.private_ip_google_access

  # ✅ GKE: Add secondary ranges
  secondary_ip_range {
    range_name    = var.pods_range_name
    ip_cidr_range = var.pods_ip_range
  }

  secondary_ip_range {
    range_name    = var.services_range_name
    ip_cidr_range = var.services_ip_range
  }
}
