## Network
resource "google_compute_network" "nextcloud-network" {
  name                    = "nextcloud-network"
  auto_create_subnetworks = false
}

## Subnet
resource "google_compute_subnetwork" "nextcloud-subnet" {
  name          = "nextcloud-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.nextcloud-network.self_link
}

## Firewall
resource "google_compute_firewall" "nextcloud-firewall" {
  name        = "nextcloud-firewall"
  network     = google_compute_network.nextcloud-network.name
  description = "Allow HTTP/HTTPS traffic"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["nextcloud-web"]
}