provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source                   = "../../modules/vpc"
  vpc_name                 = var.vpc_name
  routing_mode             = var.routing_mode
  subnet_name              = var.subnet_name
  subnet_cidr              = var.subnet_cidr
  region                   = var.region
  private_ip_google_access = var.private_ip_google_access
}

module "firewall" {
  source       = "../../modules/firewall"
  project_id   = var.project_id
  network      = module.vpc.vpc_id
  name_prefix  = "dev"
  ssh_source_ip = var.ssh_source_ip
}

module "gke" {
  source           = "../../modules/gke"
  cluster_name     = var.cluster_name
  region           = var.region
  vpc_id           = module.vpc.vpc_id
  subnet_self_link = module.vpc.subnet_self_link
  node_count       = var.node_count       # <-- Use variable here
  machine_type     = var.machine_type     # And for machine_type as well
}

/*module "cloud_sql_postgres" {
  source          = "../../modules/cloud_sql"
  instance_name   = "dev-postgres-instance"
  region          = var.region
  tier            = "db-f1-micro"
  database_name   = "devdb"
  user            = "devuser"
  password        = var.db_password
  ipv4_enabled    = false
  private_network = module.vpc.vpc_id   # Pass VPC self_link for private IP
  deletion_protection = false
}*/

module "cloud_sql_postgres" {
  source                = "../../modules/cloud_sql"
  project_id            = var.project_id
  region                = var.region
  vpc_network_self_link = module.vpc.network_self_link
  instance_name         = "dev-postgres-instance"
  database_name         = "app_db"
  database_user         = "app_user"
  password              = var.db_password
  ipv4_enabled          = false
  deletion_protection   = false
}

module "project_services" {
  source       = "../../modules/project-services"
  enabled_apis = var.enabled_apis
}

