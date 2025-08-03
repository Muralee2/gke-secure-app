data "external" "firewall_rules" {
  program = ["python3", "${path.module}/generate_firewall_rules.py"]
}

resource "google_compute_firewall" "allow_egress_to_master" {
  name    = data.external.firewall_rules.result["egress_rule_name"]
  network = var.network

  direction = "EGRESS"
  destination_ranges = ["35.191.0.0/16", "130.211.0.0/22"]
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}

resource "google_compute_firewall" "allow_internal" {
  name    = data.external.firewall_rules.result["internal_rule_name"]
  network = var.network

  direction = "INGRESS"
  source_ranges = ["10.10.0.0/16"]
  allow {
    protocol = "all"
  }
}
