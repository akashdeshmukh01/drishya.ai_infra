resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  network    = var.vpc_id            # Use VPC network ID from VPC module output
  subnetwork = var.subnet_self_link  # Use subnet self_link from VPC module output

  initial_node_count = var.node_count
  deletion_protection = false  # Add this to allow deletion

  node_config {
    machine_type = var.machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  remove_default_node_pool = true

  lifecycle {
    ignore_changes = [node_config[0].oauth_scopes]
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    disk_size_gb  = 100
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
