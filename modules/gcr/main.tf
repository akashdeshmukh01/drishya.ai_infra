# Enable Container Registry API (gcr)
resource "google_project_service" "container_registry" {
  project = var.project_id
  service = "containerregistry.googleapis.com"

  # Ensure API is enabled before using
  disable_on_destroy = false
}

# Optional: Create a Google Storage bucket backing GCR (mostly automatic, but explicit bucket can be used)
# GCR typically uses gs://artifacts.<project-id>.appspot.com
# If you want to create a bucket explicitly, uncomment below:

# resource "google_storage_bucket" "gcr_bucket" {
#   name          = "artifacts.${var.project_id}.appspot.com"
#   location      = var.region
#   force_destroy = true
#   project       = var.project_id
#   uniform_bucket_level_access = true
# }
