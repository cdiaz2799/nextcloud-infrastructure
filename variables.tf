variable "project_id" {
  description = "Google Cloud project ID"
  default     = "nextcloud-cdiaz-cloud"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  default     = "us-west1"
  type        = string
}

variable "zone" {
  description = "Google Cloud zone"
  default     = "us-west1-b"
  type        = string
}