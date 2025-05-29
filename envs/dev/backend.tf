terraform {
  backend "gcs" {
    bucket = "drishya-ai-dev2"
    prefix = "terraform/state/dev"
  }
}
