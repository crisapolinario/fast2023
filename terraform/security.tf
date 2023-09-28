resource "google_compute_firewall" "allow-jenkins" {
  name    = "allow-jenkins"
  network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-jenkins"]
  direction   = "INGRESS"

}

resource "google_compute_firewall" "allow-sonar" {
  name    = "allow-sonar"
  network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports    = ["9000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-sonar"]
  direction   = "INGRESS"

}

resource "google_compute_firewall" "allow-ssh" {
  name    = "fast-allow-ssh"
  network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-ssh"]
  direction   = "INGRESS"
}
