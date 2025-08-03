output "network_name" {
  value = google_compute_network.custom_vpc.name
}

output "subnetwork_name" {
  value = google_compute_subnetwork.custom_subnet.name
}
