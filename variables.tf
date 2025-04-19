variable "region" {
  default = "eu-north-1"
}

variable "cluster_name" {
  default = "manual-eks-cluster"
}

variable "availability_zones" {
  default = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "desired_capacity" {
  default = 5
}

variable "instance_type" {
  default = "t3.medium"
}

variable "access_key" {
}

variable "secret_key" {
}
