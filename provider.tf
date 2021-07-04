//locals {
//  tf_sa = "example-cft@cft-seed-50a5.iam.gserviceaccount.com"
//}
//
//provider "google" {
//  alias = "impersonate"
//
//  scopes = [
//    "https://www.googleapis.com/auth/cloud-platform",
//    "https://www.googleapis.com/auth/userinfo.email",
//  ]
//}
//
//data "google_service_account_access_token" "tf_sa_impersonation" {
//  provider               = google.impersonate
//  target_service_account = local.tf_sa
//  scopes                 = ["userinfo-email", "cloud-platform"]
//  lifetime               = "1200s"
//}
//
///******************************************
//  Provider credential configuration
// *****************************************/
//provider "google" {
//  access_token = data.google_service_account_access_token.tf_sa_impersonation.access_token
//}
//
//provider "google-beta" {
//  access_token = data.google_service_account_access_token.tf_sa_impersonation.access_token
//}

provider "google" {
//credentials = "${file("credentials.json")}"
project = "cft-seed-50a5"
region = "us-central1"
}