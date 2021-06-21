output "name" {
  value       = module.app-host-vpc.network_name
  description = "The name of the VPC"
}

output "app" {
  value       = local.app
  description = "The name of the logical application associated with this VPC"
}

output "subnets" {
    value = module.app-host-vpc.subnets
    description = "A map with keys of form subnet_region/subnet_name and values being the outputs of the google_compute_subnetwork resources used to create corresponding subnets."
}
