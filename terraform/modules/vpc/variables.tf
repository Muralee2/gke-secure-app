variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region where resources will be created"
  type        = string
}

variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}
