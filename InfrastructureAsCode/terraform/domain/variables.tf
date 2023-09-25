variable "aws_region" {
  description = "AWS Region to deploy resources"
  default = "us-east-1"
}

# Path: InfrastructureAsCode/terraform/variables.tf
# Profile you wish to use for deployment, can be set to default if you have only one profile
variable "aws_profile" {
  description = "AWS Profile to use for deployment"
  default = "duck"
}

variable "domain_name" {
  description = "cert name so you can create data"
  default = "ballsoffwalls.com"
}
