project_id              = "drishya-ai-dev-4"
region                  = "us-central1"
vpc_name                = "dev-vpc"
routing_mode            = "REGIONAL"
subnet_name             = "dev-subnet"
subnet_cidr             = "10.10.0.0/24"
private_ip_google_access = true
ssh_source_ip           = "203.0.113.4/32"   # Replace with your actual IP
cluster_name            = "dev-gke-cluster"

default_node_pool = {
  name                 = "systempool"
  node_count           = 2
  machine_type         = "e2-medium"
  min_count            = 2
  max_count            = 3
  auto_scaling_enabled = true
}

additional_node_pools = [
  {
    name                 = "backendnp"
    machine_type         = "e2-standard-4"
    node_count           = 3
    min_count            = 3
    max_count            = 5
    auto_scaling_enabled = true
    node_taints          = ["workloadType=backend:NoSchedule"]
    max_pods             = 30
    node_labels          = { workloadType = "backend" }
    tags                 = { NodePool = "backend" }
  },
  {
    name                 = "dbnp"
    machine_type         = "e2-highmem-8"
    node_count           = 2
    min_count            = 2
    max_count            = 3
    auto_scaling_enabled = true
    node_taints          = ["workloadType=database:NoSchedule"]
    max_pods             = 30
    node_labels          = { workloadType = "database" }
    tags                 = { NodePool = "database" }
  }
]

db_password            = "ilovemyindian@1947"  # Use secrets in practice
enabled_apis           = [
  "compute.googleapis.com",
  "container.googleapis.com",
  "sqladmin.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "iam.googleapis.com"
]

pods_range_name        = "gke-pods-range"
pods_ip_range          = "10.20.0.0/16"
services_range_name    = "gke-services-range"
services_ip_range      = "10.21.0.0/20"

repo_name = "gke-docker-repo"
bucket_name = "drishya-ai-dev-4"
location    = "US"
