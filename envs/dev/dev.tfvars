# GKE cluster variables
project_id            = "drishya-dev"
region                = "us-central1"
#zone                 = "us-central1-a"
vpc_name              = "dev-vpc"
routing_mode          = "REGIONAL"
subnet_name           = "dev-subnet"
subnet_cidr           = "10.10.0.0/24"
private_ip_google_access = true
ssh_source_ip         = "203.0.113.4/32"   # Replace with your actual IP
cluster_name          = "dev-gke-cluster"
node_count            = 1
machine_type          = "e2-medium"
db_password = "yourStrongPassword123!"

enabled_apis = [
  "compute.googleapis.com",
  "container.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "iam.googleapis.com",
  "servicenetworking.googleapis.com",
  "sqladmin.googleapis.com",
  "cloudfunctions.googleapis.com",
  "artifactregistry.googleapis.com",
  "secretmanager.googleapis.com",
  "vpcaccess.googleapis.com",
  "logging.googleapis.com",
  "monitoring.googleapis.com",
  "storage.googleapis.com"
]
