variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "frontend_image" {
  type = string
}

variable "backend_image" {
  type = string
}

variable "frontend_cpu" {
  type = number
}

variable "frontend_memory" {
  type = number
}

variable "backend_cpu" {
  type = number
}

variable "backend_memory" {
  type = number
}

variable "frontend_desired_count" {
  type = number
}

variable "backend_desired_count" {
  type = number
}

variable "execution_role_arn" {
  type = string
}

variable "task_role_arn" {
  type = string
}

variable "frontend_target_group_arn" {
  type = string
}

variable "backend_target_group_arn" {
  type = string
}

variable "db_secret_arn" {
  type = string
}

variable "secret_key_arn" {
  type = string
}

variable "db_endpoint" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "alb_security_group_id" {
  type = string
}
variable "app_config_secret_arn" {
  description = "Existing Secrets Manager JSON secret with encryption_key, private_key_pem and public_key_pem. Required for a runnable application."
  type        = string
  default     = null
}
