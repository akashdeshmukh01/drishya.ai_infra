output "gcr_project" {
  description = "The GCP project ID where GCR is enabled"
  value       = var.project_id
}

output "gcr_registry_url" {
  description = "The GCR registry URL"
  value       = "gcr.io/${var.project_id}"
}

output "repo_url" {
  description = "Docker repository URL"
  value       = "gcr.io/${var.project_id}/${var.repo_name}"
}
