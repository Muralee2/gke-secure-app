output "status" {
  value       = "Firewall rules applied"
  description = "Confirmation output"
}

output "internal_rule_name" {
  value = google_compute_firewall.internal.name
}

output "egress_rule_name" {
  value = google_compute_firewall.egress.name
}
