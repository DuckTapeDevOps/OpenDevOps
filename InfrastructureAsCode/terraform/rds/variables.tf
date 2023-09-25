variable "aws_region" {
  description = "AWS Region to deploy resources"
  default = "us-east-1"
}

# Path: InfrastructureAsCode/terraform/variables.tf
# Profile you wish to use for deployment, can be set to default if you have only one profile
variable "aws_profile" {
  description = "AWS Profile to use for deployment"
  default = "default"
}

variable "service_name" {
  description = "The sanitized service name derived from the domain name"
  type        = string
  default     = "ducktapedevops"
}

variable "aurora_mysql_version"{
  description = "value for aurora mysql version"
  default = "8.0.mysql_aurora.3.02.0"
}