## Static IP
resource "google_compute_address" "nextcloud-ip" {
  name         = "nextcloud-ip"
  network_tier = "STANDARD"
}


## Compute Engine Instance
resource "google_compute_instance" "nextcloud-web" {
  name         = "nextcloud-web"
  machine_type = "e2-micro"
  zone         = "us-west1-b"
  tags         = ["nextcloud-web", "health-check", "ssh"]

  boot_disk {
    device_name = "nextcloud-os"
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20230714"
      type  = "pd-standard"
    }
  }

  deletion_protection = true
  enable_display      = false

  network_interface {
    network    = google_compute_network.nextcloud-network.name
    subnetwork = google_compute_subnetwork.nextcloud-subnet.name
    access_config {
      network_tier = "STANDARD"
      nat_ip       = google_compute_address.nextcloud-ip.address
    }
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = true
    enable_vtpm                 = true
  }

}
