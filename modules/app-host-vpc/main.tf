locals {
  app = var.app
}

module "app-host-vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.0"

  project_id                             = var.project
  network_name                           = var.name
  routing_mode                           = "GLOBAL"
  delete_default_internet_gateway_routes = true

  subnets = [
    {
      subnet_name           = "subnet-01"
      subnet_region         = var.region
      subnet_ip             = var.primary_subnets[0]
      subnet_private_access = true
      subnet_flow_logs      = true
    },
    {
      subnet_name           = "subnet-02"
      subnet_region         = var.region
      subnet_ip             = var.primary_subnets[1]
      subnet_private_access = true
      subnet_flow_logs      = true
    },
    {
      subnet_name           = "subnet-03"
      subnet_region         = var.region
      subnet_ip             = var.primary_subnets[2]
      subnet_private_access = true
      subnet_flow_logs      = true
    }
  ]

  secondary_ranges = {
    subnet-01 = [
      {
        range_name    = "subnet-01-secondary-01"
        ip_cidr_range = var.secondary_subnets[0]
      }
    ]
  }
}

resource "google_compute_route" "route" {
  count   = var.route_to_internet ? 1 : 0
  network = module.app-host-vpc.network_name

  name             = "egress-internet"
  description      = "route through IGW to access internet"
  dest_range       = "0.0.0.0/0"
  next_hop_gateway = "default-internet-gateway"
}
