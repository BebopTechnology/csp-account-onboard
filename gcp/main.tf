#####################################
# Bebop Engineers Full/Owner Access #
#####################################
resource "google_project_iam_member" "bebop_full" {
  count  = lower(var.iam_access_level) == "full" ? 1 : 0
  role   = "roles/owner"
  member = "user:gcpsupport@beboptechnology.com"
}

##################################
# Bebop Engineers Mininal Access #
##################################
resource "google_project_iam_member" "bebop_minimal" {
  count   = lower(var.iam_access_level) == "minimal" ? length(local.minimal_roles) : 0
  project = var.project
  role    = local.minimal_roles[count.index]
  member  = "user:gcpsupport@beboptechnology.com"
}

############################################
# Bebop Service User - Manage Workstations #
############################################
resource "google_service_account" "bbpsrvcuser" {
  count        = lower(var.iam_access_level) == "minimal" ? 1 : 0
  account_id   = "bbpsrvcuser"
  display_name = "Bebop Service Account"
}

resource "google_project_iam_member" "bbpsrvcuser" {
  project = var.project
  role    = "roles/compute.admin"
  member  = "serviceAccount:${google_service_account.bbpsrvcuser.email}"
}

######################################################
# Bebop Instance Status Notification - Pub/Sub Topic #
######################################################
resource "google_pubsub_topic" "bebop_status" {
  name = "bebop-status"
}

resource "google_pubsub_subscription" "bebop_status" {
  name                 = "bebop"
  topic                = google_pubsub_topic.bebop_status.name
  ack_deadline_seconds = 10

  push_config {
    push_endpoint = "https://mcp.beboptechnology.com/api/v1/gcp/vmstatus"
  }

  expiration_policy {
    ttl = ""
  }
}

resource "google_logging_project_sink" "bebop_status" {
  name                   = "bebop-status-sink"
  description            = "Send Instance Status to Bebop"
  destination            = "pubsub.googleapis.com/${google_pubsub_subscription.bebop_status.id}"
  filter                 = "resource.type=\"gce_instance\" AND severity >= INFO"
  unique_writer_identity = true
}

resource "google_project_iam_binding" "bebop_status" {
  role = "roles/pubsub.publisher"

  members = [
    google_logging_project_sink.bebop_status.writer_identity,
  ]
}
