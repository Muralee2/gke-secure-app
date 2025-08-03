variable "cluster_name" {
  type        = string
  description = "Name of the GKE cluster"
}

variable "region" {
  type        = string
  description = "Region to deploy GKE cluster"
}

variable "gke_service_account" {
  type        = string
  description = "Service account email to use for node pool"
}
