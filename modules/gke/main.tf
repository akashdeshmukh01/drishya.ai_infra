resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region
  project  = var.project_id

  network    = var.vpc_id
  subnetwork = var.subnet_self_link

  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_range_name
    services_secondary_range_name = var.services_range_name
  }

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  deletion_protection = false
}

resource "google_container_node_pool" "default_pool" {
  name     = var.default_node_pool.name
  cluster  = google_container_cluster.primary.name
  location = var.region
  project  = var.project_id

  initial_node_count = var.default_node_pool.node_count

  node_config {
    machine_type  = var.default_node_pool.machine_type
    disk_size_gb  = 20 # Explicitly set disk size to 20GB
  }

  dynamic "autoscaling" {
    for_each = var.default_node_pool.auto_scaling_enabled ? [1] : []
    content {
      min_node_count = var.default_node_pool.min_count
      max_node_count = var.default_node_pool.max_count
    }
  }
}

resource "google_container_node_pool" "additional_pools" {
  for_each = { for np in var.additional_node_pools : np.name => np }

  name     = each.value.name
  cluster  = google_container_cluster.primary.name
  location = var.region
  project  = var.project_id

  initial_node_count = each.value.node_count

  node_config {
    machine_type  = each.value.machine_type
    disk_size_gb  = 10

    dynamic "taint" {
      for_each = lookup(each.value, "node_taints", [])
      content {
        key    = split("=", taint.value)[0]
        value  = split("=", taint.value)[1]
        effect = "NO_SCHEDULE"
      }
    }

    labels = lookup(each.value, "node_labels", null)
    tags   = each.value.tags != null ? values(each.value.tags) : null
  }

  dynamic "autoscaling" {
    for_each = each.value.auto_scaling_enabled ? [1] : []
    content {
      min_node_count = each.value.min_count
      max_node_count = each.value.max_count
    }
  }

  max_pods_per_node = lookup(each.value, "max_pods", 110)
}
