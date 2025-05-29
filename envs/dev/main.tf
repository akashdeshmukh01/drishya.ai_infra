provider "google" {
  project = var.project_id
  region  = var.region
}

# First: Enable required APIs
module "project_services" {
  source       = "../../modules/project-services"
  enabled_apis = var.enabled_apis
}

# Other modules depend on project_services (API enabling)
module "vpc" {
  source                  = "../../modules/vpc"
  vpc_name                = var.vpc_name
  routing_mode            = var.routing_mode
  subnet_name             = var.subnet_name
  subnet_cidr             = var.subnet_cidr
  region                  = var.region
  private_ip_google_access = var.private_ip_google_access
  pods_range_name         = var.pods_range_name
  pods_ip_range           = var.pods_ip_range
  services_range_name     = var.services_range_name
  services_ip_range       = var.services_ip_range
  depends_on              = [module.project_services]
}

module "firewall" {
  source        = "../../modules/firewall"
  project_id    = var.project_id
  network       = module.vpc.vpc_id
  name_prefix   = "dev"
  ssh_source_ip = var.ssh_source_ip
  depends_on    = [module.project_services]
}

module "gke" {
  source               = "../../modules/gke"
  cluster_name         = var.cluster_name
  project_id           = var.project_id
  region               = var.region
  vpc_id               = module.vpc.vpc_id
  subnet_self_link     = module.vpc.subnet_self_link
  pods_range_name      = var.pods_range_name
  services_range_name  = var.services_range_name

  default_node_pool    = var.default_node_pool
  additional_node_pools = var.additional_node_pools
  depends_on           = [module.project_services]
}

module "cloud_sql_postgres" {
  source               = "../../modules/cloud_sql"
  project_id           = var.project_id
  region               = var.region
  vpc_network_self_link = module.vpc.network_self_link
  instance_name        = "dev-postgres-instance"
  database_name        = "app_db"
  database_user        = "app_user"
  password             = var.db_password
  ipv4_enabled         = false
  deletion_protection  = false
  depends_on           = [module.project_services]
}

module "nat" {
  source                 = "../../modules/nat"
  router_name            = "dev-nat-router"
  nat_name               = "dev-nat-config"
  vpc_network            = module.vpc.network_self_link
  region                 = var.region
  nat_ip_allocate_option = "AUTO_ONLY"
  depends_on             = [module.project_services]
}

module "gcr" {
  source     = "../../modules/gcr"
  project_id = var.project_id
  region     = var.region
  repo_name  = var.repo_name
  depends_on = [module.project_services]
}
