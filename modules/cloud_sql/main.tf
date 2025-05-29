resource "google_project_service" "service_networking" {
  project = var.project_id
  service = "servicenetworking.googleapis.com"
}

resource "google_compute_global_address" "private_ip_alloc" {
  name          = "sql-private-ip-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = var.vpc_network_self_link
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = var.vpc_network_self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]

  depends_on = [google_project_service.service_networking]
}

resource "google_sql_database_instance" "postgres_instance" {
  name             = var.instance_name
  database_version = var.database_version
  region           = var.region

  settings {
    tier = var.tier

    ip_configuration {
      ipv4_enabled    = var.ipv4_enabled
      private_network = var.vpc_network_self_link
    }
  }

  deletion_protection = var.deletion_protection

  depends_on = [google_service_networking_connection.private_vpc_connection]
}

resource "google_sql_database" "default_db" {
  name     = var.database_name
  instance = google_sql_database_instance.postgres_instance.name
}

resource "google_sql_user" "default_user" {
  name     = var.database_user
  instance = google_sql_database_instance.postgres_instance.name
  password = var.password
}
