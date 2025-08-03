output "endpoint" {
  value = google_container_cluster.gke.endpoint
}

output "ingress_ip" {
  value = google_container_cluster.gke.private_cluster_config[0].master_ipv4_cidr_block
}
