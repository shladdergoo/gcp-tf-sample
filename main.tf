terraform {
  backend "gcs" {}
}

provider "google" {
  project = var.project
}

module "app-gke-cluster" {
  source       = "./modules/app-gke-cluster"
  name         = "${var.env}-${var.cluster_name}"
  location     = var.location
  node_count   = var.cluster_node_count
  machine_type = var.cluster_machine_type
}
