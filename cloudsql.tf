module "sql-db" {
  source              = "GoogleCloudPlatform/sql-db/google//modules/mysql"
  name                = "nextcloud-db-instance"
  project_id          = var.project_id
  database_version    = "MYSQL_8_0"
  deletion_protection = true

  // Master Configuration
  tier                            = "db-f1-micro"
  zone                            = var.zone
  region                          = var.region
  availability_type               = "ZONAL"
  maintenance_window_day          = 7
  maintenance_window_hour         = 12
  maintenance_window_update_track = "stable"
  disk_autoresize                 = false
  disk_type                       = "PD_HDD"
  disk_size                       = 10

  // Network Configuration
  ip_configuration = {
    allocated_ip_range : "",
    authorized_networks : [
      {
        name  = google_compute_address.nextcloud-ip.name
        value = google_compute_address.nextcloud-ip.address
      }
    ],
    enable_private_path_for_google_cloud_services : true,
    ipv4_enabled : false,
    private_network : google_compute_network.nextcloud-network.self_link,
    require_ssl : false
  }

  // Network Configuration
  ip_configuration = {
    ipv4_enabled       = true
    allocated_ip_range = google_compute_subnetwork.nextcloud-subnet.ip_cidr_range
    require_ssl        = false
    private_network    = google_compute_network.nextcloud-network.self_link
    authorized_networks = [
      {
        name  = google_compute_subnetwork.nextcloud-subnet.name,
        value = google_compute_subnetwork.nextcloud-subnet.ip_cidr_range
      }
    ]
  }

  // Nextcloud Database
  db_name      = "nextcloud-db"
  db_charset   = "utf8mb4"
  db_collation = "utf8mb4_general_ci"

  additional_users = [
    {
      name            = "nextcloud"
      host            = "localhost"
      password        = ""
      type            = "BUILT_IN"
      random_password = true
    }
  ]
}