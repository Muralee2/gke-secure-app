resource "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  node_config {
    service_account = var.gke_service_account
    disk_type       = "pd-standard"
    disk_size_gb    = 50
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name     = "primary-node-pool"
  cluster  = google_container_cluster.gke_cluster.name
  location = var.region

  node_count = 1

  node_config {
    preemptible     = false
    machine_type    = "e2-medium"
    disk_type       = "pd-standard"
    disk_size_gb    = 50
    service_account = var.gke_service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

