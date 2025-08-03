terraform {
  backend "gcs" {
    bucket = "project-og"  # Replace with your bucket name
    prefix = "gke-secure-app"
  }
}
