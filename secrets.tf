## Database Root
resource "google_secret_manager_secret" "nextcloud-db-root-pw" {
  project   = var.project_id
  secret_id = "nextcloud-db-root-pw"
  replication {
    automatic = true
  }
}
resource "google_secret_manager_secret_version" "nextcloud-db-root-pw" {
  secret      = google_secret_manager_secret.nextcloud-db-root-pw.id
  secret_data = random_password.db_user_pw.result
}
## Database User
resource "google_secret_manager_secret" "nextcloud-db-user-pw" {
  project   = var.project_id
  secret_id = "nextcloud-db-root-pw"
  replication {
    automatic = true
  }
}
resource "google_secret_manager_secret_version" "nextcloud-db-user-pw" {
  secret      = google_secret_manager_secret.nextcloud-db-user-pw.id
  secret_data = random_password.root_pwd.result
}