variable "env" {
  description = "The logical environment into which resources will be deployed, e.g. 'dev'. These map to a GCP project."
}

variable "project" {
  description = "The GCP project into which the stack will be deployed"
}

variable "region" {
  description = "The default region where resources will be created"
  default = "us-west1"
}

variable "zone" {
  description = "The default zone where resources will be created"
  default = "us-west1-a"
}
variable vpc_primary_subnets {
  default = ["10.10.10.0/24", "10.10.20.0/24", "10.10.30.0/24"]
}

variable vpc_secondary_subnets {
  default = ["192.168.64.0/24"]
}
