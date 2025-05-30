terraform {
  backend "gcs" {
    bucket = "drishya-ai-dev-4"
    prefix = "terraform/state/dev"
  }
}
