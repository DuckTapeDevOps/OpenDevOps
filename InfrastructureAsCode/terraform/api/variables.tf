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


variable "aws_cert_domain_name" {
  description = "cert name so you can create data"
  default = "ducktapedevops.com"
}

variable "service_name" {
  description = "The sanitized service name derived from the domain name"
  type        = string
  default     = "ducktapedevops"
}

variable "api_image_url" {
    description = "URL for the containerized API you wish to deploy"
    default = "657979115245.dkr.ecr.us-east-1.amazonaws.com/ducktapedevops:latest"
}

variable "api_container_cpu" {
    description = "CPU and Memory must line up with Fargate requirements. Suggested 512 (.5 vCPU) to match 1-4GB memory or 1024 (1 vCPU) to match 2-8GB memory here."
    default = 512
}

variable "api_container_memory" {
    description = "CPU and Memory must line up with Fargate requirements. Suggested 1-4GB to match 512 (.5vCPU) memory or 2-8GB to match 1024 (1 vCPU) memory here."
    default = 1024
}

variable "api_task_cpu" {
    description = "CPU and Memory must line up with Fargate requirements. Suggested 512 (.5 vCPU) to match 1-4GB memory or 1024 (1 vCPU) to match 2-8GB memory here."
    default = 512
}

variable "api_task_memory" {
    description = "CPU and Memory must line up with Fargate requirements. Suggested 1-4GB to match 512 (.5vCPU) memory or 2-8GB to match 1024 (1 vCPU) memory here."
    default = 1024
}

variable "container_port" {
  description = "Ingress port for container"
  default = 8080
}

variable "health_check_path" {
  description = "health check path"
  default = "/"
}
