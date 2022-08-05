data "google_project" "main" {}

locals {
  minimal_roles = [
    "roles/dns.admin",
    "roles/compute.admin",
    "roles/pubsub.editor",
    "roles/logging.admin",
    "roles/storage.admin",
    "roles/storage.hmacKeyAdmin",
    "roles/servicemanagement.quotaAdmin"
  ]
}
