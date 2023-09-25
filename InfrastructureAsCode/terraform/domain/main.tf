provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

terraform {
  required_version = ">= 1.0.1"
}
