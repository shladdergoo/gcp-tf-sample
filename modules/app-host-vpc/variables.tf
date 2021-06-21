variable "project" {}

variable "region" {}

variable "name" {
  description = "The name of the VPC"
}

variable "app" {
  description = "The name of the logical application associated with this VPC"
}

variable "description" {
  description = "Description of the VPC"
}

variable "primary_subnets" {
  description = "Array of primary subnet CIDR ranges"
  type = list(string)
}

variable secondary_subnets {
  description = "Array of secondary subnet CIDR ranges"
  type = list(string)
}

variable "route_to_internet" {
  description = "Create a route to the internet via the default Internet Gateway for this VPC?"
  type = bool
}
