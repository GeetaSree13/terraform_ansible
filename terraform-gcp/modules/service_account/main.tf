resource "google_service_account" "sa_name" {
    account_id   = var.account_id
    display_name = var.display_name

  
}


resource "google_project_iam_member" "sa_roles" {
    project = var.project_id
    for_each = toset(var.sa_roles)
    role    = each.value
    member  = "serviceAccount:${google_service_account.sa_name.email}"

}