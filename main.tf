terraform {
  backend "gcs" {}
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "coolapp-host-vpc" {
  source            = "./modules/app-host-vpc"
  project           = var.project
  region            = var.region
  name              = "${var.env}-coolapp-vpc"
  app               = "coolapp"
  description       = "Host VPC for coolapp"
  primary_subnets   = var.vpc_primary_subnets
  secondary_subnets = var.vpc_secondary_subnets
  route_to_internet = true
}
