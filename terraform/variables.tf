variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "project_name" {
  description = "Project name used for naming resources"
  type        = string
  default     = "securebank"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "frontend_image" {
  description = "Frontend Docker image"
  type        = string
  default     = "boluex/securebank-frontend:latest"
}

variable "backend_image" {
  description = "Backend Docker image"
  type        = string
  default     = "boluex/securebank-backend:latest"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "securebank"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "securebank"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "frontend_cpu" {
  description = "Frontend task CPU units"
  type        = number
  default     = 256
}

variable "frontend_memory" {
  description = "Frontend task memory in MB"
  type        = number
  default     = 512
}

variable "backend_cpu" {
  description = "Backend task CPU units"
  type        = number
  default     = 512
}

variable "backend_memory" {
  description = "Backend task memory in MB"
  type        = number
  default     = 1024
}

variable "frontend_desired_count" {
  description = "Number of frontend tasks"
  type        = number
  default     = 2
}

variable "backend_desired_count" {
  description = "Number of backend tasks"
  type        = number
  default     = 2
}
variable "app_config_secret_arn" {
  description = "Existing Secrets Manager JSON secret with encryption_key, private_key_pem and public_key_pem. Required for a runnable application."
  type        = string
  default     = null
}
