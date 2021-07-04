//resource "google_compute_resource_policy" "XYZ-snapshot-schedule" {
//  name        = "XYZ-snapshot-schedule"
//  provider    = "google-beta"
//  project     = "project1"
//  region      = "us-central1"
//
//  snapshot_schedule_policy {
//    schedule {
//      daily_schedule {
//        days_in_cycle = 1
//        start_time    = "02:00"
//      }
//    }
//    retention_policy {
//      max_retention_days    = 7
//      on_source_disk_delete = "APPLY_RETENTION_POLICY"
//    }
//    snapshot_properties {
//      labels = {
//        app      = "XYZ"
//      }
//    }
//  }
//}


//resource "google_storage_bucket" "shashi-site" {
//  name          = "image-store"
//  location      = "EU"
//  force_destroy = true
//
//  uniform_bucket_level_access = true

//  website {
//    main_page_suffix = "index.html"
//    not_found_page   = "404.html"
//  }
//  cors {
//    origin          = ["http://image-store.com"]
//    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
//    response_header = ["*"]
//    max_age_seconds = 3600
//  }
//}
resource "google_compute_instance" "default" {
  name         = "virtual-machine-from-terraform"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "projects/test1-us-network-n/global/networks/scs-us-vpc-n"
    subnetwork        = "projects/test1-us-network-n/region/us-central1/subnetworks/snet-test1-us-secops-n-n-pvt-002"
    subnetwork_project = "test1-us-network-n"


  }

    metadata_startup_script = "sudo apt-get update && sudo apt-get install apache2 -y && echo '<!doctype html><html><body><h1>Avenue Code is the leading software consulting agency focused on delivering end-to-end development solutions for digital transformation across every vertical. We pride ourselves on our technical acumen, our collaborative problem-solving ability, and the warm professionalism of our teams.!</h1></body></html>' | sudo tee /var/www/html/index.html"

    // Apply the firewall rule to allow external IPs to access this instance
    tags = ["http-server"]
}

//resource "google_compute_firewall" "http-server" {
//  name    = "default-allow-http-terraform"
//  network = "default"
//
//  allow {
//    protocol = "tcp"
//    ports    = ["80"]
//  }

  // Allow traffic from everywhere to instances with an http-server tag
//  source_ranges = ["0.0.0.0/0"]
//  target_tags   = ["http-server"]
//}

//output "ip" {
//  value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
//}