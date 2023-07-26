## Generate Random Passwords
resource "random_password" "root_pwd" {
  length  = 16
  special = false
}
resource "random_password" "db_user_pw" {
  length  = 16
  special = false
}

## Database Instance
resource "google_sql_database_instance" "nextcloud-db-instance" {
  name                = "nextcloud-db-instance"
  database_version    = "MYSQL_8_0"
  project             = var.project_id
  region              = var.region
  deletion_protection = true
  root_password       = random_password.root_pwd.result
  settings {
    tier              = "db-f1-micro"
    disk_type         = "PD_HDD"
    disk_size         = 10
    disk_autoresize   = false
    availability_type = "ZONAL"
    backup_configuration {
      enabled                        = true
      binary_log_enabled             = true
      start_time                     = "01:00"
      point_in_time_recovery_enabled = false
      transaction_log_retention_days = 7
      location                       = var.region
    }
  }
}

## Database
resource "google_sql_database" "nextcloud-db" {
  name      = "nextcloud-db"
  instance  = google_sql_database_instance.nextcloud-db-instance.name
  charset   = "utf8mb4"
  collation = "utf8mb4_general_ci"
}

## Database User
resource "google_sql_user" "nextcloud-db-user" {
  name     = "nextcloud"
  instance = google_sql_database_instance.nextcloud-db-instance.name
  password = random_password.db_user_pw.result
}