variable "project" {
  description = "The GCP project into which the stack will be deployed"
}

variable "env" {
  description = "The logical environment into which resources will be deployed, e.g. 'dev'"
  default = "dev"
}

variable "location" {
  description = "The region into which resources will be deployed"
  default = "us-west1"
}

variable "cluster_name" {
  default = "app-cluster"
}

variable "cluster_node_count" {}

variable "cluster_machine_type" {}
