terraform {
  backend "gcs" {
    bucket                      = "ex-cvt-tfs"
    prefix                      = "ci_cd_infra/"
//    impersonate_service_account = "example-cft@cft-seed-50a5.iam.gserviceaccount.com"
    credentials = "./creds/serviceaccount.json"
  }
}
