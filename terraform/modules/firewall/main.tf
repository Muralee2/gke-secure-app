resource "google_compute_firewall" "allow_ssh_http" {
  name    = "allow-ssh-http"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

