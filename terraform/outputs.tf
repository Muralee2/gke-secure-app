output "vpc_network_name" {
  description = "The name of the VPC network"
  value       = module.vpc.network_name
}

output "vpc_subnetwork_name" {
  description = "The name of the subnetwork"
  value       = module.vpc.subnetwork_name
}

output "gke_cluster_name" {
  value       = module.gke.cluster_name
  description = "Name of the GKE cluster"
}

output "gke_cluster_endpoint" {
  description = "GKE cluster endpoint"
  value       = module.gke.endpoint
}

output "gke_cluster_ca_certificate" {
  value       = module.gke.ca_certificate
  description = "Cluster CA certificate"
}

output "gke_endpoint" {
  value = module.gke.endpoint  # ✅ Valid (after step 1 fix)
}
