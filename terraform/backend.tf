terraform {
  backend "gcs" {
    bucket = "my-project-og"  # Replace with your bucket name
    prefix = "gke-secure-app"
  }
}
