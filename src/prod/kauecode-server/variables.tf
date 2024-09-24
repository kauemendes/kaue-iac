variable "environment" {
    description = "The environment for the deployment"
    type        = string
    default     = "prod"
}

variable "public_subnets_cidr" {
    description = "The CIDR blocks for the public subnets"
    type        = list(string)
    default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "private_subnets_cidr" {
    description = "The CIDR blocks for the public subnets"
    type        = list(string)
    default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
    description = "The availability zones for the subnets"
    type        = list(string)
    default     = ["sa-east-1a", "sa-east-1c"]
}

variable "primary_availability_zones" {
    description = "The availability zones for the subnets"
    type        = string
    default     = "sa-east-1a"
}

variable "project_name" {
    description = "The name of the project"
    type        = string
    default     = "kauecode"
}

variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}

variable "region" {
    description = "The region for the deployment"
    type        = string
    default     = "sa-east-1"
}