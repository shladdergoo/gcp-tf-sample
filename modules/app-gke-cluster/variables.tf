variable "location" {}

variable "name" {}

variable "node_count" {
  type    = number
  default = 2
}

variable "machine_type" {
  default = "e2-medium"
}
