output "network_name" {
  value       = google_compute_network.vpc_network.name
  description = "The name of the created VPC network"
}

output "subnetwork_name" {
  value       = google_compute_subnetwork.subnetwork.name
  description = "The name of the created subnet"
}

output "subnetwork_self_link" {
  value       = google_compute_subnetwork.subnetwork.self_link
  description = "The self-link of the subnet"
}
