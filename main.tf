resource "google_service_account" "this" {
  account_id   = var.account.id
  display_name = var.account.display_name
}

resource "google_project_iam_binding" "this" {
  project = var.project_id
  role    = google_project_iam_custom_role.this.name
  members = [
    "serviceAccount:${google_service_account.this.email}"
  ]
}

resource "google_service_account_iam_binding" "this" {
  service_account_id = google_service_account.this.name
  role               = "roles/iam.workloadIdentityUser"
  members = [
    "serviceAccount:${var.project_id}.svc.id.goog[${var.namespace}/${var.kubernetes_service_account}]"
  ]
}

resource "google_project_iam_custom_role" "this" {
  role_id     = var.role.id
  title       = var.role.title
  description = var.role.description
  permissions = var.role.permissions
}
