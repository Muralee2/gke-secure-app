data "external" "rule_names" {
  program = ["python3", "${path.module}/generate_firewall_rules.py"]
}

resource "google_compute_firewall" "internal" {
  name    = data.external.rule_names.result["internal_rule_name"]
  project = var.project_id
  network = var.network

  allows {
    protocol = "all"
  }

  direction = "INGRESS"
  source_ranges = ["10.10.0.0/16"]
}

resource "google_compute_firewall" "egress" {
  name    = data.external.rule_names.result["egress_rule_name"]
  project = var.project_id
  network = var.network

  allows {
    protocol = "tcp"
    ports    = ["443"]
  }

  direction          = "EGRESS"
  destination_ranges = ["172.16.0.0/28"] # typical GKE master CIDR, customize as needed
}
